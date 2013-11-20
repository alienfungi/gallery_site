class AddFieldsToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :about, :text, default: ''
    add_column :locations, :hours, :text, default: ''
    add_column :locations, :contact, :text, default: ''
    add_column :locations, :home, :text, default: ''
    add_column :locations, :shows, :text, default: ''
    add_column :locations, :gallery, :text, default: ''
  end
end
