class SessionsController < ApplicationController
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

  def destroy
  end

end
