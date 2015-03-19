class PasswordResetsController < ApplicationController
	def index
	end

  def new
  end

  def create
  	@user = User.find_by(email: params[:password_reset][:email].downcase)
  	if @user
  		# @user.create_reset_digest
  		# @user.send_password_reset_email
  		redirect_to password_resets_path
  	else
  		flash.now[:danger] = "Email address was not found"
  		render 'new'
 		end
  end

  def edit
  end
end
