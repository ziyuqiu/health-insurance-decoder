require 'test_helper'

class DiseasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @disease = diseases(:one)
  end

  test "should get index" do
    get diseases_url
    assert_response :success
  end

  test "should get new" do
    get new_disease_url
    assert_response :success
  end

  test "should create disease" do
    assert_difference('Disease.count') do
      post diseases_url, params: { disease: { name: @disease.name } }
    end

    assert_redirected_to disease_url(Disease.last)
  end

  test "should show disease" do
    get disease_url(@disease)
    assert_response :success
  end

  test "should get edit" do
    get edit_disease_url(@disease)
    assert_response :success
  end

  test "should update disease" do
    patch disease_url(@disease), params: { disease: { name: @disease.name } }
    assert_redirected_to disease_url(@disease)
  end

  test "should destroy disease" do
    assert_difference('Disease.count', -1) do
      delete disease_url(@disease)
    end

    assert_redirected_to diseases_url
  end
end
