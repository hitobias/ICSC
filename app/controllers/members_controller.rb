class MembersController < ApplicationController
  before_action :set_group, only: [:new, :create]

  def new
    @member = @group.members.build
  end

  def create
    @member = @group.members.build(member_params)
    if @member.save
      @member.group.update_attribute(:no_of_applicants, 1)
      @member.group.update_attribute(:donate_amount, donate_amount(@member.conference_option))
  
    else
      render "new"
    end
  end

  def index
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def member_params
      params.require(:member).permit(:firstname, :lastname, :gender, :country, :church, :email, :conference_option)
    end

    def set_group
      @group = current_user.groups.build(user_id: current_user.id)
    end

    def donate_amount(conference_option)
      if conference_option == "OC"
        100
      elsif conference_option == "BC" || conference_option == "AC"
        250
      else
        150
      end    
    end   
end
