# == Schema Information
#
# Table name: genres
#
#  id          :integer          not null, primary key
#  location_id :integer
#  name        :string(255)
#  description :text             default("")
#  created_at  :datetime
#  updated_at  :datetime
#

class Genre < ActiveRecord::Base
  belongs_to :location

  has_many :artists
end
