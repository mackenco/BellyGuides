class RestaurantsController < ApplicationController

  def create
    restaurant = Restaurant.new(params[:restaurant])

    if restaurant.save
      render json: restaurant, status: :ok
    else
      render json: restaurant.errors, status: 422
    end
  end

  def update
    restaurant = Restaurant.find(params[:id])

    if restaurant.update_attributes(params[:restaurant])
      head :ok
    else
      render json: restaurant.errors, status: 422
    end
  end

  def destroy
    restaurant = Restaurant.find(params[:id])

    if restaurant.destroy
      head :ok
    else
      render json: restaurant.errors, status: 422
    end
  end
end
