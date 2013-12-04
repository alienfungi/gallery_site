class CreateContactMessages < ActiveRecord::Migration
  def change
    create_table :contact_messages do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :message
      t.string :ip
      t.integer :location_id

      t.timestamps
    end
  end
end
