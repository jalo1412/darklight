require 'test_helper'

class ParentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get parent_index_url
    assert_response :success
  end

end
