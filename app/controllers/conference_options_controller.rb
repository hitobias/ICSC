class ConferenceOptionsController < ApplicationController
  before_action :set_conference, only: [:new, :create]
  def new
    @conference_option = @conference.conference_options.build
  end

  def create
    @conference_option = @conference.conference_options.build(conference_option_params)
    if @conference_option.save
    else
    end
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  private
    def set_conference
      @conference = Conference.where(enbaled: true)
    end

    def conference_option_params
      params.require(:conference_option).permit(:short_code, :option_name, :donate_amount)
    end
end
