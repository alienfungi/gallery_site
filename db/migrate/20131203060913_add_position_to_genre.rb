class AddPositionToGenre < ActiveRecord::Migration
  def change
    add_column :genres, :position, :integer, default: 0
  end
end
