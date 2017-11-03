class FavoritesController < ApplicationController
  include SessionsHelper

  def index
    @favorites = current_user.favorites
    @resources = current_user.resources_favorited
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
  #   @user_favorite = current_user.favorites.find_by(resource_id: params[:id])
  #   p "******************"
  #   p user_favorite
  #   @favorite.destroy
  #   redirect_to user_path(current_user)
  end

end
