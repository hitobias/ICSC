class DonationsController < ApplicationController
  def new
  end

  def create
  end

  def index
  	@groups = current_user.groups.paginate(page: params[:page]).order('created_at DESC')
  end
end
