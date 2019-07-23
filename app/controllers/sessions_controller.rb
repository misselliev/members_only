class SessionsController < ApplicationController
  before_action :current_user

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      flash[:success] = "Successfully logged in!"
      log_in @user
      redirect_to new_post_path
    else
      flash[:danger] = "Check your credentials!"
      redirect_to signin_path
    end
  end

  def home
  end
  
  def destroy
    log_out if logged_in?
    flash[:success] = 'You logged out! See you soon!'
    redirect_to root_path
  end
end

  

