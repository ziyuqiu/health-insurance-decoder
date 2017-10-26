class BodyPartSymptomDisease < ApplicationRecord
  validates :body_part_id, uniqueness: { scope: [:symptom_id, :disease_id] }
  
  belongs_to :body_part
  belongs_to :symptom
  belongs_to :disease
end
