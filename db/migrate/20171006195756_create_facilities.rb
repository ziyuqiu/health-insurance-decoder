class CreateFacilities < ActiveRecord::Migration[5.1]
  def change
    create_table :facilities do |t|
      t.string :name
      t.string :specialty
      t.string :open_hour
      t.integer :contact_id

      t.timestamps
    end
  end
end
