class SessionsController < ApplicationController
  before_action :current_user, only: [:log_in, :log_out]
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])

    if @user && @user.authenticate(params[:session][:password])
      flash.now[:warning] = "EXITO"
      redirect_to users_index_path
    else
      flash.now[:warning] = "Check your credentials!"
      redirect_to users_create_path
    end
  end

  def home
  end
  
  def destroy
    if logged_in?
      log_out
      redirect_to root_path
    else
      redirect_to users_path
    end
  end

end
