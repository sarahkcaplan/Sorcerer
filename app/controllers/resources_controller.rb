class ResourcesController < ApplicationController

  include SessionsHelper

  def index
    @resources = Resource.all
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)
    @resource.author = current_user

    if @resource.save
      redirect_to resources_path
    else
      @error = @resource.errors.full_messages
      render :new
    end
  end

  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy
    redirect_to user_path(current_user)
  end

  def search
    tag = search_params[:tag]
    @resources = Resource.resources_by_tags(tag)

    if !logged_in?
      render :index
    elsif current_user.user_type == "teacher"
      render :'users/teacher_show'
    else
      render :'users/student_show'
    end
  end

  private

  def resource_params
    params.require(:resource).permit(:title, :url)
  end

  def search_params
    params.permit(:tag)
  end

end


