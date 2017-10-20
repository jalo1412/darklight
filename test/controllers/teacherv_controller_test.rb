require 'test_helper'

class TeachervControllerTest < ActionDispatch::IntegrationTest
  test "should get attending" do
    get teacherv_attending_url
    assert_response :success
  end

end
