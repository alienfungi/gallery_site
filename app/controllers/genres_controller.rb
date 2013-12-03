class GenresController < ApplicationController
  before_action :set_genre, only: [:show, :edit, :update]

  def create
    @genre = @location.genres.build(genre_params)
    @valid = @genre.save
    redirect_to location_gallery_path(@location)
  end

  def edit
  end

  def index
    @genres = @location.genres
  end

  def new
    @genre = Genre.new
  end

  def show
  end

  def update
  end

private

  def genre_params
    params.require(:genre).permit(:name, :description)
  end

  def set_genre
    @genre = @location.genres.find(params[:id])
  end

end
