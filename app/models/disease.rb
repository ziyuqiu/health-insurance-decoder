class Disease < ApplicationRecord
  has_many :body_part_symptom_diseases
  has_many :symptoms, :through => :body_part_symptom_diseases
  has_many :body_parts, :through => :body_part_symptom_diseases
end
