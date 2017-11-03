class FavoritesController < ApplicationController
  include SessionsHelper

  def index
    @favorites = current_user.favorites
  end

  def show

  end

  def new

  end

  def create
    @favorite = current_user.favorites.find_or_create_by(resource_id: params[:resource_id])
    redirect_to :back
  end

  def edit

  end

  def update

  end

  def destroy
    @favorite = Favorite.find(params[:id])
    p "******************"
    p params[:id]
    @favorite.destroy
  end

end
