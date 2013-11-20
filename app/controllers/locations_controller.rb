class LocationsController < ApplicationController

  def create
  end

  def edit
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
  end

private

  def location_params
  end

end
