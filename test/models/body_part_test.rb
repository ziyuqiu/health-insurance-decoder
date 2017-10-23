require 'test_helper'

class BodyPartTest < ActiveSupport::TestCase
  def setup
    @body_part = BodyPart.new(id: 1, name: "Head")
  end

  test "should be valid" do
    assert @body_part.valid?
  end

  test "name should be present" do
    @body_part.name = "    "
    assert_not @body_part.valid?
  end
end
