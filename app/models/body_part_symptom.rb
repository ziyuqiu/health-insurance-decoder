class BodyPartSymptom < ApplicationRecord
  validates :body_part_id, uniqueness: { scope: :symptom_id }
  
  belongs_to :body_part
  belongs_to :symptom
end
