# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Location < ActiveRecord::Base
  validates(:name,
            uniqueness: {case_sensitive: false},
            format: { with: /\A[a-z0-9_]+\z/ }
           )

  def to_param
    name
  end
end
