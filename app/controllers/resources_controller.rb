def index
  @resource = Recource.new
end

def new
  @resource = Resource.new()
end

def create
  @resource - Resource.new(resource_param)
  @resource.user = current_user

  if @resource.save
    redirect_to resources_path
  else
    @error = @ resoures.errors.full_messages
    render :'resources/new'
end

def show
  @question = Question.find(params[:id])
end


def destroy
  @resource = Resourse.find((params[:id]))
end