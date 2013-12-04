# == Schema Information
#
# Table name: pics
#
#  id          :integer          not null, primary key
#  image       :string(255)
#  artist_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#  name        :string(255)
#  description :text
#

class Pic < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  belongs_to :artist

  validates_presence_of :image

  validates :name,
    presence: true,
    format: { with: /\A[\(\) \w]+\z/ },
    uniqueness: { case_sensitive: false }

  before_destroy :remember_ids
  after_destroy :remove_id_directory

private

  def remember_ids
    @id = id
    @artist_id = artist_id
  end

  def remove_id_directory
    FileUtils.remove_dir("#{Rails.root}/public/uploads/pic/#{@artist_id}/#{@id}")
  end

end
