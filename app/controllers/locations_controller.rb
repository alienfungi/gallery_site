class LocationsController < ApplicationController

  def create
  end

  def edit
    @field = params[:field]
    respond_to do |format|
      format.js do
      end
    end
  end

  def index
  end

  def new
  end

  def show
    if Location.where(name: params[:id]).count == 1
      redirect_to location_home_path(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
    @field = params[:field]
    @location.update_attributes(@field => params[:location][@field])
    respond_to do |format|
      format.js do
      end
    end
  end

end
