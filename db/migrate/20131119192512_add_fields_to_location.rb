class AddFieldsToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :about, :text
    add_column :locations, :hours, :text
    add_column :locations, :contact, :text
    add_column :locations, :home, :text
    add_column :locations, :shows, :text
    add_column :locations, :gallery, :text
  end
end
