# == Schema Information
#
# Table name: artist_locations
#
#  id          :integer          not null, primary key
#  location_id :integer
#  artist_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class ArtistLocation < ActiveRecord::Base
  belongs_to :artist
  belongs_to :location
end
