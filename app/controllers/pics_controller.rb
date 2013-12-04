class PicsController < ApplicationController
  before_action :set_pic, only: [:destroy, :edit, :show, :update]
  before_action :set_artist, only: [:create, :index, :new]

  def create
    @pic = @artist.pics.build(pic_params)
    @valid = @pic.save
    if @valid
      redirect_to location_artist_pics_path(@location, artist_id: @artist)
    else
      redirect_to :back
    end
  end

  def destroy
    @pic.destroy
    redirect_to :back
  end

  def edit
  end

  def index
    @pics = @artist.pics.order('created_at DESC').paginate(page: params[:page])
  end

  def new
    @pic = Pic.new
  end

  def show
  end

  def update
    @valid = @pic.update(pic_params)
    if @valid
      redirect_to location_artist_pics_path
    else
      redirect_to :back
    end
  end

private

  def pic_params
    params.require(:pic).permit(:description, :image, :name)
  end

  def set_pic
    @pic = Pic.find(params[:id])
  end

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

end
