class UsersController < ApplicationController
include SessionsHelper

  def show
      if current_user && current_user.user_type == 'teacher'
        @resources = Resource.all
        @favorited_resources = current_user.resources_favorited
        render :teacher_show
      elsif current_user && current_user.user_type == 'student'
        @resources = Resource.all
        @favorited_resources = current_user.resources_favorited
        render :student_show
      else
        @errors = ["Please sign in"]
        render :'resources/index'
      end
  end

  def teachers_my_show
    @resources = current_user.resources_posted
    respond_to do |format|
      format.html { render :teacher_show }
      format.json { render partial: '/partials/teachers_resource_display' }
    end

  end

  def teachers_my_fav
    @resources = current_user.resources_favorited
    render :teacher_show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.user_type = params[:user_type]
    if @user.save
      session[:id] = @user.id
      redirect_to user_path(@user), notice: "User was successfully created."
    else
      @errors = @user.errors.full_messages
      render :new, status: 422
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to sessions_path, notice: "User was successfully destroyed."
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :user_type)
  end

end
