# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in!'
    else
      flash.now.alert = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "Logged out successfully"
  end
end
