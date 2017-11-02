def index
  @resource = Resource.all
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
    @error = @ resoures.errors.full_messages
    render :'resource/new'
end

def show
  @resource = Resource.find(params[:id])
end

def destroy
  @resource = Resource.find(params[:id])
  @resource.destroy
  redirect_to resources_path
end