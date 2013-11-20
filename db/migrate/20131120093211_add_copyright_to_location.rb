class AddCopyrightToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :copyright, :string, default: ''
  end
end
