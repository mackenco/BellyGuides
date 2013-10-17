class MapsController < ApplicationController
  before_filter :require_owner!, only: [:edit, :update, :destroy]

  def show
    @map = Map.includes(:restaurants, :favorites).find(params[:id])
    @restaurants = @map.restaurants
    @favorite = @map.favorites.where(user_id:current_user.id).length == 0 ? true : false
    @comment = Comment.new
    @comments = @map.comments.order("id DESC")

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
    1.times { @map.restaurants.build }
  end

  def create
    begin
      ActiveRecord::Base.transaction do
        @map = Map.new(params[:map])
        @restaurants = []

        params[:map][:restaurants_attributes].each do |r, data|
          data.delete_if{ |k| k == "_destroy" }

          restaurant = Restaurant.new(data)
          restaurant.convert_address() unless data[:address].empty?
          restaurant.place_type_display()

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
      flash[:notice] = @map.errors.values.join(". ")
      @restaurants.each { |r| flash[:notice] << r.errors.values.join(". ")}
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
            data.delete_if{ |k| k == "_destroy" }

            restaurant = Restaurant.find(data[:id])
            restaurant.address = data[:address]
            restaurant.covert_address()

            restaurant.update_attributes(data)
            restaurant.place_type_display()
          end

          @map.update_attributes(params[:map])
          raise "invalid" unless @map.valid? && @restaurants.all? { |obj| obj.valid? }
        end
      rescue
        flash[:notice] = @map.errors.values.join(". ")
        @restaurants.each { |r| flash[:notice] << r.errors.values.join(". ")}
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

    flash[:notice] = "Successfully cloned map."
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
