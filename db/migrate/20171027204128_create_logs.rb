class CreateLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :logs do |t|
      t.integer :symptom_id
      t.integer :severity

      t.timestamps
    end
  end
end
