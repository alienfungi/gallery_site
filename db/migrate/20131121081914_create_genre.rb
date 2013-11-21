class CreateGenre < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.integer :location_id
      t.string :name
      t.text :description, default: ''

      t.timestamps
    end
  end
end
