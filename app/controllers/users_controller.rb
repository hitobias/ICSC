class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      UserMailer.account_activation(@user).deliver_now
      flash.now[:info] = "Please check your email to activate your account."
      redirect_to root_path
  	else
  		render 'new'
  	end
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
      redirect_to new_member_path
  end

  private
  	def user_params
  		params.require(:user).permit(:username, :firstname, :lastname, :gender, :country, :church, :email, :mobile, :phone, :password, :password_confirmation, :comments)
  	end
end
