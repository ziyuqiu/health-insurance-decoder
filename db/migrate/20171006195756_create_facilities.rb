class CreateFacilities < ActiveRecord::Migration[5.1]
  def change
    create_table :facilities do |t|
      t.string :name
      t.string :specialty
      t.string :open_hour
      t.integer :contact_id
      t.string :email
      t.string :phone_number
      t.string :address

      t.timestamps
    end
  end
end
