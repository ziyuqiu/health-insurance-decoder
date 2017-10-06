class CreateSymptoms < ActiveRecord::Migration[5.1]
  def change
    create_table :symptoms do |t|
      t.string :name
      t.integer :frequency

      t.timestamps
    end
  end
end
