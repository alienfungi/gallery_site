# == Schema Information
#
# Table name: artists
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  genre_id         :integer
#  bio              :text             default("")
#  self_portrait_id :integer
#

class Artist < ActiveRecord::Base
  has_many :artist_locations
  has_many :locations, through: :artist_locations

  has_many :pics
  belongs_to :genre
  has_one :self_portrait, class_name: 'Pic'
end
