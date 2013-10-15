class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.new()
    @favorite.user, @favorite.map = current_user, Map.find(params[:map_id])

    if @favorite.save
      flash[:notice] = "Like!"
    else
      flash[:notice] = "Something went wrong"
    end
    redirect_to map_url(params[:map_id])
  end

  def destroy
    map = Map.find(params[:map_id])
    @favorite = Favorite.find_by_user_id_and_map_id(current_user.id, map.id)
    if @favorite.destroy
      flash[:notice] = "Dislike!"
    else
      flash[:notice] = "Something went wrong"
    end
    redirect_to map_url(params[:map_id])
  end

  def index
    @current_favorites = Favorite.includes(:map).where(user_id:current_user.id)
    @maps = @current_favorites.map { |f| f.map }
  end
end