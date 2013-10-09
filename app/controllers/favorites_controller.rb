class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.new(user_id: current_user.id, map_id: params[:map_id])
    if @favorite.save
      flash[:notice] = "Like!"
    else
      flash[:errors] = "Something went wrong"
    end
    redirect_to map_url(params[:map_id])
  end

  def destroy
    @favorite = Favorite.find_by_user_id_and_map_id(current_user.id, params[:map_id])
    if @favorite.destroy
      flash[:notice] = "Dislike!"
    else
      flash[:errors] = "Something went wrong"
    end
    redirect_to map_url(params[:map_id])
  end
end
