class LoginController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if(!params[:email].present? || !params[:password].present?)
      flash.now[:alert] = "Please fill all the required fields."
      render :index, status: :unprocessable_entity
      return
    end

    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:alert] = "Oops! Incorrect email or password."
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_index_path
  end
end