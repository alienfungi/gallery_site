# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  about      :text             default("")
#  hours      :text             default("")
#  contact    :text             default("")
#  home       :text             default("")
#  shows      :text             default("")
#  gallery    :text             default("")
#  copyright  :string(255)      default("")
#

class Location < ActiveRecord::Base
  has_many :artist_locations
  has_many :artists, through: :artist_locations

  validates(:name,
            uniqueness: {case_sensitive: false},
            format: { with: /\A[a-z0-9_]+\z/ }
           )

  def self.from_param(param)
    find_by_name!(param)
  end

  def to_param # overwritten
    name
  end

end
