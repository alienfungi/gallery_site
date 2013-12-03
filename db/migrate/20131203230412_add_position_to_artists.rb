class AddPositionToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :position, :integer, default: 0
  end
end
