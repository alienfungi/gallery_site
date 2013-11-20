# == Schema Information
#
# Table name: pics
#
#  id         :integer          not null, primary key
#  image      :string(255)
#  caption    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Pic < ActiveRecord::Base
  #mount_uploader :image, ImageUploader

  belongs_to :artist

  validates_presence_of :image

  before_destroy :remember_id
  after_destroy :remove_id_directory

private

  def remember_id
    @id = id
  end

  def remove_id_directory
    FileUtils.remove_dir("#{Rails.root}/public/uploads/pic/#{@artist.id}/#{@id}")
  end

end
