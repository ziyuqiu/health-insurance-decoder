class BodyPartSymptomDisease < ApplicationRecord
  belongs_to :body_part
  belongs_to :symptom
  belongs_to :disease
end
