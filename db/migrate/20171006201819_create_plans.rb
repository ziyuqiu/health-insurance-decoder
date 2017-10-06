class CreatePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :plans do |t|
      t.string :name
      t.string :category
      t.integer :company_id

      t.timestamps
    end
  end
end
