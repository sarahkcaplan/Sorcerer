class FavoritesController < ApplicationController
  include SessionsHelper

  def index
    @favorited_resources = current_user.resources_favorited

    respond_to do |f|
      f.html { render :_index}
      f.json { render json: @favorited_resources.to_json}
      f.js
    end
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
    @favorite = current_user.favorites.find(params[:id])

    @favorite.destroy
    redirect_to favorites_path
  end

end
