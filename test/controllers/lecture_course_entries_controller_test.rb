require 'test_helper'

class LectureCourseEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lecture_course_entry = lecture_course_entries(:one)
  end

  test "should get index" do
    get lecture_course_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_lecture_course_entry_url
    assert_response :success
  end

  test "should create lecture_course_entry" do
    assert_difference('LectureCourseEntry.count') do
      post lecture_course_entries_url, params: { lecture_course_entry: { Lecture_course_id: @lecture_course_entry.Lecture_course_id, date: @lecture_course_entry.date, description: @lecture_course_entry.description, number: @lecture_course_entry.number, time: @lecture_course_entry.time } }
    end

    assert_redirected_to lecture_course_entry_url(LectureCourseEntry.last)
  end

  test "should show lecture_course_entry" do
    get lecture_course_entry_url(@lecture_course_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_lecture_course_entry_url(@lecture_course_entry)
    assert_response :success
  end

  test "should update lecture_course_entry" do
    patch lecture_course_entry_url(@lecture_course_entry), params: { lecture_course_entry: { Lecture_course_id: @lecture_course_entry.Lecture_course_id, date: @lecture_course_entry.date, description: @lecture_course_entry.description, number: @lecture_course_entry.number, time: @lecture_course_entry.time } }
    assert_redirected_to lecture_course_entry_url(@lecture_course_entry)
  end

  test "should destroy lecture_course_entry" do
    assert_difference('LectureCourseEntry.count', -1) do
      delete lecture_course_entry_url(@lecture_course_entry)
    end

    assert_redirected_to lecture_course_entries_url
  end
end
