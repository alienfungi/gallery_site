# == Schema Information
#
# Table name: artists
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  bio              :text             default("")
#  self_portrait_id :integer
#  position         :integer          default(0)
#

class Artist < ActiveRecord::Base
  has_many :artist_locations
  has_many :locations, through: :artist_locations

  has_many :pics, dependent: :destroy
  has_one :self_portrait, class_name: 'Pic'

  validates :name,
    presence: true,
    format: { with: /\A[ \w]+\z/ },
    uniqueness: { case_sensitive: false }

  before_destroy :remember_id
  after_destroy :remove_pic_directory

private

  def remember_id
    @id = id
  end

  def remove_pic_directory
    FileUtils.remove_dir("#{Rails.root}/public/uploads/pic/#{@id}")
  end

end
