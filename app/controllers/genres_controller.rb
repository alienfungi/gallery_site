class GenresController < ApplicationController
  before_action :set_genre, only: [:destroy, :edit, :show, :update]

  def create
    @genre = @location.genres.build(genre_params)
    @valid = @genre.save
    redirect_to location_gallery_path(@location)
  end

  def destroy
    @genre.destroy
    redirect_to :back
  end

  def edit
  end

  def index
    @genres = @location.genres.order('position ASC')
  end

  def new
    @genre = Genre.new
  end

  def reorder # js
    new_position = params.delete(:new_position)
    @genres = @location.genres.load
    @genres.each do |genre|
      genre.update_attributes(position: new_position[genre.id.to_s].to_i)
    end
    render nothing: true, status: 200
  end

  def show
  end

  def update
    @genre.update_attributes(genre_params)
    redirect_to location_gallery_path(@location)
  end

private

  def genre_params
    params.require(:genre).permit(:name, :description)
  end

  def set_genre
    @genre = @location.genres.find(params[:id])
  end

end
