class CreateTreatments < ActiveRecord::Migration[5.1]
  def change
    create_table :treatments do |t|
      t.string :name
      t.string :resource_category
      t.integer :disease_id

      t.timestamps
    end
  end
end
