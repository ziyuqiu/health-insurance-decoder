require 'test_helper'

class DiseaseTest < ActiveSupport::TestCase
  def setup
    @disease = Disease.new(id: 1, name: "Headache")
  end

  test "should be valid" do
    assert @disease.valid?
  end

  test "name should be present" do
    @disease.name = "    "
    assert_not @disease.valid?
  end

  test "disease name should not be too long" do
    @disease.name = "a" * 76
    assert_not @disease.valid?
  end

  test "disease name should be unique" do
    duplicate_disease = @disease.dup
    @disease.save
    assert_not duplicate_disease.valid?
  end
end
