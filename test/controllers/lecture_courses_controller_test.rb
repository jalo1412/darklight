require 'test_helper'

class LectureCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lecture_course = lecture_courses(:one)
  end

  test "should get index" do
    get lecture_courses_url
    assert_response :success
  end

  test "should get new" do
    get new_lecture_course_url
    assert_response :success
  end

  test "should create lecture_course" do
    assert_difference('LectureCourse.count') do
      post lecture_courses_url, params: { lecture_course: { Course_id: @lecture_course.Course_id, Lecture_id: @lecture_course.Lecture_id } }
    end

    assert_redirected_to lecture_course_url(LectureCourse.last)
  end

  test "should show lecture_course" do
    get lecture_course_url(@lecture_course)
    assert_response :success
  end

  test "should get edit" do
    get edit_lecture_course_url(@lecture_course)
    assert_response :success
  end

  test "should update lecture_course" do
    patch lecture_course_url(@lecture_course), params: { lecture_course: { Course_id: @lecture_course.Course_id, Lecture_id: @lecture_course.Lecture_id } }
    assert_redirected_to lecture_course_url(@lecture_course)
  end

  test "should destroy lecture_course" do
    assert_difference('LectureCourse.count', -1) do
      delete lecture_course_url(@lecture_course)
    end

    assert_redirected_to lecture_courses_url
  end
end
