class MapsController < ApplicationController
  def new
    @map = Map.new
    1.times { @map.restaurants.build }
  end

  def edit
    @map = Map.find(params[:id])
  end

  def create
    begin
      ActiveRecord::Base.transaction do
        @map = Map.new(params[:map])
        @restaurants = []

        1.times do |i|
          address = params["restaurant#{i}"]["address"]
          coords = convert_address(address)

          restaurant = Restaurant.new(params["restaurant#{i}".to_sym])
          restaurant.lat = coords[0]
          restaurant.long = coords[1]
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
      # fail
      redirect_to new_map_url
    else
      # fail
      redirect_to map_url(@map)
    end
  end

  def update
  end

  def destroy
  end

  def show
    @map = Map.includes(:restaurants).find(params[:id])
    @restaurant = @map.restaurants.first
  end
end
