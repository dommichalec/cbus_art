class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # uncomment below if you want users signed in upon account creation
      # session[:user_id] = @user.id
      redirect_to root_path, notice: "Your account was successfully created!"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to users_path, notice: "Your account has been successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    first_name = @user.first_name
    @user.destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "We're sorry to see you go, #{first_name}! If you need anything from us again don't hesitate to reach out :)"
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :portfolio_url, :password, :password_confirmation)
  end
end
