class AddBioToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :bio, :text, default: ''
    add_column :artists, :self_portrait_id, :integer
  end
end
