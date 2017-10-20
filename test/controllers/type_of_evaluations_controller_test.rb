require 'test_helper'

class TypeOfEvaluationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_of_evaluation = type_of_evaluations(:one)
  end

  test "should get index" do
    get type_of_evaluations_url
    assert_response :success
  end

  test "should get new" do
    get new_type_of_evaluation_url
    assert_response :success
  end

  test "should create type_of_evaluation" do
    assert_difference('TypeOfEvaluation.count') do
      post type_of_evaluations_url, params: { type_of_evaluation: { name: @type_of_evaluation.name, weight: @type_of_evaluation.weight } }
    end

    assert_redirected_to type_of_evaluation_url(TypeOfEvaluation.last)
  end

  test "should show type_of_evaluation" do
    get type_of_evaluation_url(@type_of_evaluation)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_of_evaluation_url(@type_of_evaluation)
    assert_response :success
  end

  test "should update type_of_evaluation" do
    patch type_of_evaluation_url(@type_of_evaluation), params: { type_of_evaluation: { name: @type_of_evaluation.name, weight: @type_of_evaluation.weight } }
    assert_redirected_to type_of_evaluation_url(@type_of_evaluation)
  end

  test "should destroy type_of_evaluation" do
    assert_difference('TypeOfEvaluation.count', -1) do
      delete type_of_evaluation_url(@type_of_evaluation)
    end

    assert_redirected_to type_of_evaluations_url
  end
end
