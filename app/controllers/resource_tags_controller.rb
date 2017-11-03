class ResourceTagsController < ApplicationController
  include SessionsHelper

  def new
    render :new
  end

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
    @resource_tag = ResourceTag.where(resource: params[:resource_id], tag: tag.id)
    resource_tag_id = @resource_tag.id
    ResourceTag.destroy(resource_tag_id)
  end

  def tag_params
    params.permit(:name)
  end
end
