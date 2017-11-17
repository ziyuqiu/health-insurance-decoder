require 'test_helper'

class BodyPartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @body_part_horn = body_parts(:horn)
    @body_part_tail = body_parts(:tail)
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
      post body_parts_url, params: { body_part: { name: "Batwing" } }
    end

    assert_redirected_to body_part_url(BodyPart.last)
  end

  test "should show body_part" do
    get body_part_url(@body_part_horn)
    assert_response :success
  end

  test "should get edit" do
    get edit_body_part_url(@body_part_horn)
    assert_response :success
  end

  test "should update body_part" do
    patch body_part_url(@body_part_horn), params: { body_part: { name: @body_part_horn.name } }
    assert_redirected_to body_part_url(@body_part_horn)
  end

  test "should destroy body_part" do
    assert_difference('BodyPart.count', -1) do
      delete body_part_url(@body_part_horn)
    end

    assert_redirected_to body_parts_url
  end

  test "should get body diagram" do
    get body_diagram_path
    assert_response :success
  end  

  test "body diagram image switch" do
    get body_diagram_url
    assert_select "div#body-image", count: 1
  end
end
