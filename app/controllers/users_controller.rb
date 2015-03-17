class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save

  	else
  		render 'new'
  	end
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
  end

  private
  	def user_params
  		params.require(:user).permit(:firstname, :lastname, :gender, :country, :church, :email, :mobile, :phone, :username, :password, :password_confirmation, :comments, :active)
  	end
end
