class ArtistsController < ApplicationController
  before_action :set_artist, only: [:destroy, :edit, :show, :update]

  def create
    @artist = Artist.new(artist_params)
    @valid = @artist.save
    if @valid
      ArtistLocation.create(location_id: @location.id, artist_id: @artist.id)
      redirect_to location_artists_path(@location)
    else
      redirect_to :back
    end
  end

  def destroy
    @artist_location = ArtistLocation.where(artist_id: @artist, location_id: @location)
    @artist_location.destroy_all
    redirect_to location_artists_path(@location)
  end

  def edit
  end

  def index
    @artists = @location.artists.order('position ASC')
  end

  def new
    @artist = Artist.new()
  end

  def reorder
    new_position = params.delete(:new_position)
    @artists = @location.artists.load
    @artists.each do |artist|
      artist.update_attributes(position: new_position[artist.id.to_s].to_i)
    end
    render nothing: true, status: 200
  end

  def show
  end

  def update
    @artist.update_attributes(artist_params)
    redirect_to location_artists_path(@location)
  end

private

  def artist_params
    params.require(:artist).permit(:name, :bio, :self_portrait)
  end

  def set_artist
    @artist = Artist.find(params[:id])
  end

end
