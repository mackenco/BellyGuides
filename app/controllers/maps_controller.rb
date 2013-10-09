class MapsController < ApplicationController
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
  end

  def destroy
    @map = Map.find(params[:id])
    @map.destroy
    flash[:notice] = "Successfully deleted map"
    redirect_to user_url(current_user)
  end

  def show
    @map = Map.includes(:restaurants).find(params[:id])
    @restaurants = @map.restaurants
    @restaurant = @restaurants.first
    @finished, @unfinished = [], []
    @map.restaurants.each do |rest|
      rest.completed ? @finished << rest : @unfinished << rest
    end

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @restaurants }
    end
  end

  def index
  end

end
