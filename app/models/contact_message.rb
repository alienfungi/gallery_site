# == Schema Information
#
# Table name: contact_messages
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  email       :string(255)
#  phone       :string(255)
#  message     :text
#  ip          :string(255)
#  location_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class ContactMessage < ActiveRecord::Base
  belongs_to :location
  validates_presence_of :name, :email
end
