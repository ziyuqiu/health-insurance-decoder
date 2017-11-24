class CreateBodyPartSymptoms < ActiveRecord::Migration[5.1]
  def change
    create_table :body_part_symptoms do |t|
      
      t.integer :body_part_id
      t.integer :symptom_id
      
      t.timestamps
    end
  end
end
