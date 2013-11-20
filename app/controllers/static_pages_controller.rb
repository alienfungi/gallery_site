class StaticPagesController < ApplicationController

  def index
  end

  def about
  end

  def contact
  end

  def home
    @location = Location.find_by_name(session[:location_id])
  end

  def shows
  end

end
