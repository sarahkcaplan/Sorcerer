class ResourceTagsController < ApplicationController
  include SessionsHelper

  def create
    tag = Tag.find_or_create_by(name: tag_params)
    @resource_tag = ResourceTag.new(resource: params[:resource_id], tag: tag.id)
    if @resource_tag.save
      redirect_to user_path(current_user)
    else
      @errors = @resource_tag.errors.full_messages
      render :create
    end
  end

  def destroy
    p "***************************************"
    p params[:id]
    @resource_tag = ResourceTag.find(params[:id])
    @resource_tag.destroy
    redirect_to user_path(current_user)
  end


  def tag_params
    params.permit(:name)
  end
end
