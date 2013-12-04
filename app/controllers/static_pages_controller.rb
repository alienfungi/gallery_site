class StaticPagesController < ApplicationController

  def index
  end

  def about
  end

  def contact
    @contact_message = ContactMessage.new
  end

  def home
    @location = Location.find_by_name(session[:location_id])
  end

  def shows
  end

end
