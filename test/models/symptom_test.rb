require 'test_helper'

class SymptomTest < ActiveSupport::TestCase
  def setup
    @symptom = Symptom.new(id: 1, name: "Floating one inch off the ground")
  end

  test "should be valid" do
    assert @symptom.valid?
  end

  test "name should be present" do
    @symptom.name = "    "
    assert_not @symptom.valid?
  end

  test "symptom name should not be too long" do
    @symptom.name = "a" * 76
    assert_not @symptom.valid?
  end

  test "symptom name should be unique" do
    duplicate_symptom = @symptom.dup
    @symptom.save
    assert_not duplicate_symptom.valid?
  end
end
