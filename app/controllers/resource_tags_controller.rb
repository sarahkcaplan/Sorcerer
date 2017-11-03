
class ResourceTagsController < ApplicationController
  include SessionsHelper

  def new
    @tag = Tag.new
    render :new
  end

  def create
    find_tag
    @resource_tag = ResourceTag.new(resource: find_resource, tag: find_tag)
    if @resource_tag.tag_id == nil
      @errors = ["This tag is already associated with the resource"]
      @tag = Tag.new(name: find_tag.name)
      render :new
    elsif @resource_tag.save
      redirect_to user_path(current_user)
    else
      @errors = ["This tag is already associated with the resource"]
      @tag = Tag.new(name: find_tag.name)
      render :new
    end
  end

  def destroy
    @resource_tag = ResourceTag.find(params[:id])
    @resource_tag.destroy
    redirect_to user_path(current_user)

    #@resource_tag = ResourceTag.where(resource: params[:resource_id], tag: tag.id)
    #resource_tag_id = @resource_tag.id
    #ResourceTag.destroy(resource_tag_id)
  end

  private

  def tag_attributes
    params.require(:tag).permit(:name, :permission)
  end

  def find_tag
    @tag = Tag.find_or_create_by(tag_attributes)
  end

  def find_resource
    @resource = Resource.find(params[:resource_id])
  end

end
