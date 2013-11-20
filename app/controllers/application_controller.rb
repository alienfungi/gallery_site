class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_location

private

  def set_location
    session[:location_id] = params[:location_id] unless params[:location_id].nil?
  end
end
