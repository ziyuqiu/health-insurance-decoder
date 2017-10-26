class CreateBodyPartSymptomDiseases < ActiveRecord::Migration[5.1]
  def up
    drop_table :body_part_symptom_diseases
    drop_table :part_symptom_diseases
  end

  def change
    create_table :body_part_symptom_diseases do |t|
      t.integer :body_part_id
      t.integer :symptom_id
      t.integer :disease_id

      t.timestamps
    end
  end
end
