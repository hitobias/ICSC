class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(username: params[:session][:username].downcase)
  	if user && user.authenticate(params[:session][:password])
  		flash[:success] = "Welcome to this site."
  		log_in user
  		redirect_to user
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
