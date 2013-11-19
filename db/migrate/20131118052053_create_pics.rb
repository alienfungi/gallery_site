class CreatePics < ActiveRecord::Migration
  def change
    create_table :pics do |t|
      t.string :image
      t.integer :artist_id

      t.timestamps
    end
  end
end
