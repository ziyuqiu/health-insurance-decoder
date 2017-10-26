require 'test_helper'

class BodyPartSymptomDiseaseTest < ActiveSupport::TestCase
  def setup
    @body_part_1 = BodyPart.new(name: "headz")
    @symptom_1 = Symptom.new(name: "sharp painz")
    @disease_1 = Disease.new(name: "migrainez")

    @symptom_2 = Symptom.new(name: "dull painz")
    @disease_2 = Disease.new(name: "headachez")

    @bp_s_d = BodyPartSymptomDisease.create(
      body_part_id: @body_part_1.id,
      symptom_id: @symptom_1.id,
      disease_id: @disease_1.id
    )
  end

  test "should be valid" do
    assert @body_part_1.valid?

  end

end
