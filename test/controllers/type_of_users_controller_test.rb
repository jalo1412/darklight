require 'test_helper'

class TypeOfUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_of_user = type_of_users(:one)
  end

  test "should get index" do
    get type_of_users_url
    assert_response :success
  end

  test "should get new" do
    get new_type_of_user_url
    assert_response :success
  end

  test "should create type_of_user" do
    assert_difference('TypeOfUser.count') do
      post type_of_users_url, params: { type_of_user: { type_of_user: @type_of_user.type_of_user } }
    end

    assert_redirected_to type_of_user_url(TypeOfUser.last)
  end

  test "should show type_of_user" do
    get type_of_user_url(@type_of_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_of_user_url(@type_of_user)
    assert_response :success
  end

  test "should update type_of_user" do
    patch type_of_user_url(@type_of_user), params: { type_of_user: { type_of_user: @type_of_user.type_of_user } }
    assert_redirected_to type_of_user_url(@type_of_user)
  end

  test "should destroy type_of_user" do
    assert_difference('TypeOfUser.count', -1) do
      delete type_of_user_url(@type_of_user)
    end

    assert_redirected_to type_of_users_url
  end
end
