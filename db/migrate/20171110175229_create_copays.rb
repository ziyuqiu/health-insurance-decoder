class CreateCopays < ActiveRecord::Migration[5.1]
  def change
    create_table :copays do |t|
      t.float :in_network
      t.float :out_network
      t.integer :plan_id
      t.integer :treatment_id
      t.boolean :copay_or_coinsurance_in
      t.boolean :copay_or_coinsurance_out
      t.string :note
      t.timestamps
    end
  end
end
