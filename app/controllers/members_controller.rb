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
      params.require(:member).permit(:firstname, :lastname, :chinese_name, :gender, :age, :country, :church, :pick_up, :arrived_date, :arrived_time, :arrived_airport, :arrived_flight_no, :drop_off, :departed_date, :departed_time, :departed_airport, :departed_flight_no, :conference_option, :comments)
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
