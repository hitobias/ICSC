class HomeController < ApplicationController
  def index
  end

  def announcement
  end

  def registration
  end

  def donate
  	redirect_to('https://www.chlife-stat.org/donate/')
  end

  def contact
  end

  def login
  end
end
