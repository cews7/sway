class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "Welcome!"
      redirect_to dashboard_path
    else
      flash[:alert] = "Failed to login!"
      render :new
    end
  end

  def destroy
    session.clear
  end
end
