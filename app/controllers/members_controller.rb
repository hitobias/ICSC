class MembersController < ApplicationController
  before_action :set_group, only: [:new, :create]

  def new
    @member = @group.members.build
  end

  def create
    @member = @group.members.build(member_params)

      respond_to do |format|
      if @member.save
        format.html {  
          single_application_update(@member)
          redirect_to @member,  notice: 'Member was successfully created.'
        }

        format.json {
          single_application_update(@member)
          render action: 'show', status: :created, location: @member
        }

        format.js {
          single_application_update(@member)
          render action: 'show', status: :created, location: @member
        }    
      else
        format.html { render "new" }
        format.json { render json: @member.errors, status: :unprocessable_entity}
        format.js   { render json: @member.errors, status: :unprocessable_entity}
      end
    end
  end

  def index
    @members = current_user.members.where(:enabled => true).paginate(page: params[:page]).order('created_at DESC')
  end

  def show
    @member = Member.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @member = Member.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @member = Member.find(params[:id])

    respond_to do |format|
      if @member.update_attributes(member_params)
        @member.group.update_attribute(:donate_amount, donate_amount(@member.conference_option))
        format.html { redirect_to members_path, notice: "Member was successfully updated."}
        format.json { head :no_content }
        format.js
      else
        format.html { render action: "edit" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
        format.js
      end
    end
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

    def single_application_update(member)
      member.group.update_attribute(:no_of_applicants, 1)
      member.group.update_attribute(:donate_amount, donate_amount(@member.conference_option))
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
