class TeachervController < ApplicationController
  include TeachervHelper
  def index
    set_teacher
    set_curso
    set_lecture
  end

  def teaching
    set_teacher
    set_curso
    set_lecture
    set_lecture_course
    end

  def attending
    set_teacher
    set_curso
    set_lecture
    set_lecture_course
    set_lecture_course_entryn(params[:lectureCouEntId].to_i)
    set_student_attendance_list
  end
  def my_lectures_course_entries
    set_teacher
    set_curso
    set_lecture
    set_lecture_course
    set_lecture_course_entry
  end
end
