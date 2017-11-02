class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.find_or_create_by(resource_id: params[:id], fan_id: current_user.id)
  end

  def destroy
    @favorite = Favorite.where(resource_id: params[:id], fan_id: current_user.id)
    favorite_id = @favorite.id
    Favorite.destroy(favorite_id)
  end

end
