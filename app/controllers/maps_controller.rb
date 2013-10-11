class MapsController < ApplicationController
  before_filter :require_owner!, only: [:edit, :update, :destroy]

  def show
    @map = Map.includes(:restaurants, :favorites).find(params[:id])
    @restaurants = @map.restaurants
    @lat = @restaurants.average('latitude')
    @long = @restaurants.average('longitude')

    @finished, @unfinished = [], []
    @map.restaurants.each do |rest|
      rest.completed ? @finished << rest : @unfinished << rest
    end
    @favorite = @map.favorites.where(user_id:current_user.id).length == 0 ? true : false
    @comment = Comment.new
    @comments = Comment.order("id DESC").where(map_id: params[:id])

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @restaurants }
    end
  end

  def index
    @maps = Map.all
  end

  def new
    @map = Map.new
    3.times { @map.restaurants.build }
  end

  def create
    begin
      ActiveRecord::Base.transaction do
        @map = Map.new(params[:map])
        @restaurants = []

        params[:map][:restaurants_attributes].each do |r, data|
          next if data[:name] == ""

          address = data[:address]
          coords = convert_address(address)

          data.delete_if{ |k| k == "_destroy" }
          restaurant = Restaurant.new(data)
          restaurant.latitude = coords[0]
          restaurant.longitude = coords[1]
          restaurant.completed = false
          @restaurants << restaurant
        end

        @map.owner = current_user
        @map.save

        @restaurants.each do |restaurant|
          restaurant.map = @map
          restaurant.save
        end

        raise "invalid" unless @map.valid? && @restaurants.all? { |obj| obj.valid? }

      end
    rescue
      render :new
    else
      flash[:notice] = "Successfully created map."
      redirect_to map_url(@map)
    end
  end

  def edit
    @map = Map.find(params[:id])
  end

  def update
      begin
        ActiveRecord::Base.transaction do
          @map = Map.find(params[:id])
          @restaurants = []

          params[:map][:restaurants_attributes].each do |r, data|

            address = data[:address]
            coords = convert_address(address)

            data.delete_if{ |k| k == "_destroy" }
            data["latitude"] = coords[0]
            data["longitude"] = coords[1]

            restaurant = Restaurant.find(data[:id])
            restaurant.update_attributes(data)
          end

          @map.update_attributes(params[:map])
          raise "invalid" unless @map.valid? && @restaurants.all? { |obj| obj.valid? }
        end
      rescue
        render :edit
      else
        flash[:notice] = "Successfully updated map."
        redirect_to @map
      end
    end

  def clone
    @map = Map.find(params[:id])
    @clone = @map.dup
    @restaurants = []
    @clone.owner = current_user
    @clone.description += " Cloned from #{@map.owner.username}"
    @clone.save

    @restaurants = @map.restaurants.map{ |r| r.dup }

    @restaurants.each do |restaurant|
      restaurant.completed = false
      restaurant.note = ""
      restaurant.map = @clone
      restaurant.save
    end
    redirect_to @clone
  end

  def destroy
    @map = Map.find(params[:id])
    @map.destroy
    flash[:notice] = "Successfully deleted map"
    redirect_to user_url(current_user)
  end

  def require_owner!
    @map = Map.find(params[:id])

    return if @map.nil?

    unless @map.owner == current_user
      render :text => "Unauthorized", :status => 403
    end
  end
end
