class RestaurantsController < ApplicationController

  def create
    restaurant = Restaurant.new(params[:restaurant])

    address = params[:restaurant][:address]
    coords = convert_address(address)
    restaurant.latitude = coords[0]
    restaurant.longitude = coords[1]
    restaurant.completed = false
    restaurant.map_id = params[:map_id]

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

  def nearby
    @restaurants = current_user.restaurants.near(params[:address], params[:distance])

    if request.xhr?
      render partial: "nearby", locals: {restaurants: @restaurants}
    else
      redirect_to user_url(current_user)
    end
  end
end
