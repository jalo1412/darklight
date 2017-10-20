require 'test_helper'

class SonControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get son_index_url
    assert_response :success
  end

end
