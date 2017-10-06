require 'test_helper'

class BodyPartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @body_part = body_parts(:one)
  end

  test "should get index" do
    get body_parts_url
    assert_response :success
  end

  test "should get new" do
    get new_body_part_url
    assert_response :success
  end

  test "should create body_part" do
    assert_difference('BodyPart.count') do
      post body_parts_url, params: { body_part: { name: @body_part.name } }
    end

    assert_redirected_to body_part_url(BodyPart.last)
  end

  test "should show body_part" do
    get body_part_url(@body_part)
    assert_response :success
  end

  test "should get edit" do
    get edit_body_part_url(@body_part)
    assert_response :success
  end

  test "should update body_part" do
    patch body_part_url(@body_part), params: { body_part: { name: @body_part.name } }
    assert_redirected_to body_part_url(@body_part)
  end

  test "should destroy body_part" do
    assert_difference('BodyPart.count', -1) do
      delete body_part_url(@body_part)
    end

    assert_redirected_to body_parts_url
  end
end
