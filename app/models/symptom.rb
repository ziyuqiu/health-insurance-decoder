class Symptom < ApplicationRecord
  validates :name, presence: true, length: { maximum: 75 }, uniqueness: true
  
  has_many :body_part_symptom_diseases
  has_many :body_parts, :through => :body_part_symptom_diseases
  has_many :diseases, :through => :body_part_symptom_diseases
end
