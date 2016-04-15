class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome back, #{user.first_name}! You're currently signed in."
      redirect_to user_path(user.id)
    else
      flash.now[:notice] = "Hmm... we can't find a user with that email/password combination"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You're all signed out. We'll see you again soon!"
    redirect_to root_url
  end
end
