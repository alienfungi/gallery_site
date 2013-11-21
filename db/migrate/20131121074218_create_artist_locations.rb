class CreateArtistLocations < ActiveRecord::Migration
  def change
    create_table :artist_locations do |t|
      t.integer :location_id
      t.integer :artist_id

      t.timestamps
    end
  end
end
