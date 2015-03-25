class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:login_field])
    user ||= User.find_by(username: params[:session][:login_field])

  	if user && user.authenticate(params[:session][:password])
      if user.activated? && user.role == "normal"
        log_in user
        params[:session][:remember_me] == "1" ? remember(user) : forget(user)
        redirect_to user
      elsif user.activated? && user.role == "root"
        log_in user
        params[:session][:remember_me] == "1" ? remember(user) : forget(user)
        redirect_to conferences_new_path
      else
        flash.now[:danger] = "Your account was not actived, please check your email."
        redirect_to root_path
      end

  	else
  		flash.now[:danger] = "Invalid username or password, please try again."
  		render 'new'
  	end
  end

  def destroy
  	log_out if logged_in?
  	redirect_to root_path
  end
end
