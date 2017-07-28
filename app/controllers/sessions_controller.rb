class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Successful login"
      redirect_to "/dashboard"
    end
  end

  def show

  end

  def destroy
    session[:user_id] = nil

    redirect_to root_path
  end
end
