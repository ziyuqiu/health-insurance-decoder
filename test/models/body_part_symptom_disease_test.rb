require 'test_helper'

class BodyPartSymptomDiseaseTest < ActiveSupport::TestCase
  def setup
    @body_part_1 = BodyPart.new(id: 1, name: "headz")
    @symptom_1 = Symptom.new(id: 2, name: "sharp painz")
    @disease_1 = Disease.new(id: 3, name: "migrainez")

    @symptom_2 = Symptom.new(id: 4, name: "dull painz")
    @disease_2 = Disease.new(id: 5, name: "headachez")

    @tuple1 = BodyPartSymptomDisease.new(
      body_part_id: @body_part_1.id,
      symptom_id: @symptom_1.id,
      disease_id: @disease_1.id
    )
    @tuple2 = BodyPartSymptomDisease.new(
      body_part_id: @body_part_1.id,
      symptom_id: @symptom_2.id,
      disease_id: @disease_2.id
    )
  end
end
