# app/controllers/users_controller.rb
class UsersController < ApplicationController

  # GET /users/new
  # Display registration form
  def new
    @user = User.new
  end

  # POST /users
  # Register the user
  def create
    @user = User.new(user_params)

    if @user.save
      # Log in the user after successful registration
      session[:user_id] = @user.id

      redirect_to user_path(@user), notice: 'Successfully registered!'
    else
      render :new
    end
  end

  # GET /users/:id
  # Display user profile
  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
