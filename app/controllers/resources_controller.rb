def index
<<<<<<< HEAD
  @resource = Resource.all
=======
  @resources = Recource.all
>>>>>>> 06188bfa57279111e5a144c5eee8e1eb0802bc18
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
<<<<<<< HEAD
    @error = @ resoures.errors.full_messages
    render :'resource/new'
=======
    @error = @resoure.errors.full_messages
    render :new
>>>>>>> 06188bfa57279111e5a144c5eee8e1eb0802bc18
end

def show
  @resource = Resource.find(params[:id])
end

def destroy
  @resource = Resource.find(params[:id])
  @resource.destroy
  redirect_to resources_path
<<<<<<< HEAD
end
=======
end
>>>>>>> 06188bfa57279111e5a144c5eee8e1eb0802bc18
