class CreateCopays < ActiveRecord::Migration[5.1]
  def change
    create_table :copays do |t|
      t.float :in_network
      t.float :out_network
      t.integer :plan_id
      t.integer :treatment_id
      t.boolean :copay_or_coinsurance

      t.timestamps
    end
  end
end
