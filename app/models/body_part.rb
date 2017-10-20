class BodyPart < ApplicationRecord
  has_many :symptoms
  has_many :diseases
end
