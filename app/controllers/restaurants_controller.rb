class RestaurantsController < ApplicationController
  before_filter :require_owner!, only: :destroy

  def create
    restaurant = Restaurant.new(params[:restaurant])

    restaurant.convert_address()
    restaurant.map = Map.find(params[:map_id])

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

  def require_owner!
    restaurant = Restaurant.find(params[:id])
    return if restaurant.nil?
    unless restaurant.map.owner == current_user
      render :text => "Unauthorized", :status => 403
    end
  end
end
