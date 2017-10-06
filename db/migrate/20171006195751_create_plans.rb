class CreatePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :plans do |t|
      t.string :name
      t.string :category
      t.string :company_id
      t.string :integer

      t.timestamps
    end
  end
end
