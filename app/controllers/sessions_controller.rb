class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:login_field])
    user ||= User.find_by(username: params[:session][:login_field])

  	if user && user.authenticate(params[:session][:password])
      if user.actived == "Y" && user.role == "normal"
        flash[:success] = "Welcome to this site."
        log_in user
        redirect_to user
      else
        flash.now[:danger] = "Your account was not actived, please check your email."
        render 'new'
      end

  	else
  		flash.now[:danger] = "Invalid username or password, please try again."
  		render 'new'
  	end
  end

  def destroy
  	log_out
  	redirect_to root_path
  end
end
