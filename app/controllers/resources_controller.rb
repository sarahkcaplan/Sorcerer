class FavoritesController < ApplicationController

  def index
    @resources = Recource.all
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_param)
    @resource.user = current_user

    if @resource.save
      redirect_to resources_path
    else
      @error = @resoure.errors.full_messages
      render :new
    end
  end

  def show
    @resource = Resource.find(params[:id])
  end


  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy
    redirect_to resources_path
  end

end
