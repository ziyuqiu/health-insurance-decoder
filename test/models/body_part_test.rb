require 'test_helper'

class BodyPartTest < ActiveSupport::TestCase
  def setup
    @body_part = BodyPart.new(id: 1, name: "Head")
    @s = "PAW"
    @s_white = "   PAW     "
  end

  test "should be valid" do
    assert @body_part.valid?
  end

  test "name should be present" do
    @body_part.name = "    "
    assert_not @body_part.valid?
  end

  test "body part name should not be too long" do
    @body_part.name = "a" * 76
    assert_not @body_part.valid?
  end

  test "body part name should be unique" do
    duplicate_part = @body_part.dup
    @body_part.save
    assert_not duplicate_part.valid?
  end

  test "name should be lowercase" do
    new_body_part = BodyPart.create(name: @s)
    assert_equal @s.downcase, new_body_part.name
  end

  test "validation should remove whitespace" do
    new_body_part = BodyPart.create(name: @s_white)
    assert_equal @s.downcase, new_body_part.name
  end
end
