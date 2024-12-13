class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if missing_required_fields
      flash.now[:alert] = "Please enter all the required fields"
      render :index, status: :unprocessable_entity
      return
    end

    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "User created successfully"
      redirect_to login_index_path
    else
      flash.now[:alert] = "User not created"
      render :index, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def missing_required_fields
    user_params.values.any?(&:blank?)    
  end
end