require 'test_helper'

class StatusOfAttendancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @status_of_attendance = status_of_attendances(:one)
  end

  test "should get index" do
    get status_of_attendances_url
    assert_response :success
  end

  test "should get new" do
    get new_status_of_attendance_url
    assert_response :success
  end

  test "should create status_of_attendance" do
    assert_difference('StatusOfAttendance.count') do
      post status_of_attendances_url, params: { status_of_attendance: { status: @status_of_attendance.status } }
    end

    assert_redirected_to status_of_attendance_url(StatusOfAttendance.last)
  end

  test "should show status_of_attendance" do
    get status_of_attendance_url(@status_of_attendance)
    assert_response :success
  end

  test "should get edit" do
    get edit_status_of_attendance_url(@status_of_attendance)
    assert_response :success
  end

  test "should update status_of_attendance" do
    patch status_of_attendance_url(@status_of_attendance), params: { status_of_attendance: { status: @status_of_attendance.status } }
    assert_redirected_to status_of_attendance_url(@status_of_attendance)
  end

  test "should destroy status_of_attendance" do
    assert_difference('StatusOfAttendance.count', -1) do
      delete status_of_attendance_url(@status_of_attendance)
    end

    assert_redirected_to status_of_attendances_url
  end
end
