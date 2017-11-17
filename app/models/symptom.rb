class Symptom < ApplicationRecord
  before_validation do
    self.name = self.name.strip.downcase
  end
  validates :name, presence: true, length: { maximum: 75 }, uniqueness: { case_sensitive: false }
  has_many :body_part_symptom_diseases
  has_many :logs    
  has_many :body_parts, :through => :body_part_symptom_diseases
  has_many :diseases, :through => :body_part_symptom_diseases
end
