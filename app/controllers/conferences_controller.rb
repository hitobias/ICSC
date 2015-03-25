class ConferencesController < ApplicationController
  def new
    @conference = Conference.new
  end

  def create
    @conference = Conference.new(conference_params)
    if @conference.save

    else
      
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def index
  end

  private
    def conference_params
      params.require(:conference).permit(:name, :deadline, :announcement)
    end
end
