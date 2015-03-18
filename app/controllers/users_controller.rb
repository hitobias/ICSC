class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      redirect_to root_path
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
  		params.require(:user).permit(:username, :firstname, :lastname, :gender, :country, :church, :email, :mobile, :phone, :password, :password_confirmation, :comments)
  	end
end
