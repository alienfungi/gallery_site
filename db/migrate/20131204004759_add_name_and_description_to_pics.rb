class AddNameAndDescriptionToPics < ActiveRecord::Migration
  def change
    add_column :pics, :name, :string
    add_column :pics, :description, :text
  end
end
