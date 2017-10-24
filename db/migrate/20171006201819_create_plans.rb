class CreatePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :plans do |t|
      t.string :name
      t.string :category
      t.integer :company_id
      t.float :coinsurance
      t.float :deductible
      t.float :out_of_pocket_max
      t.float :inpatient_copay
      t.float :outpatient_copay

      t.timestamps
    end
  end
end
