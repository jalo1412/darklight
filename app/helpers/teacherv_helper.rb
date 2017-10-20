module TeachervHelper
  def set_teacher
    usuarioid = session[:user_id]
    @profe = Teacher.where(User_id: usuarioid)
  end

  def set_curso
    @cursos = Course.where(Teacher_id: @profe[0].id)
  end

  def set_lecture
    @lectures = Lecture.all.where(Teacher_id: @profe[0].id)
  end

  def set_lecture_course
    total_lecture_course = LectureCourse.all
    @lecture_courses = []
    total_lecture_course.each do |l|
      @lecture_courses.push(l) if l.Lecture.Teacher_id == @profe[0].id
    end
end

  def set_lecture_course_entryn(n)
    @lecture_course_entry = LectureCourseEntry.find(n) if n != 0
    set_lecture_course_entry if n == 0
end

  def set_lecture_course_entry
    @lecture_course_entries = LectureCourseEntry.all
    @lecture_course_entries.each do |l|
      unless @lecture_courses.include?(l.Lecture_course)
        @lecture_course_entries.delete(l)
      end
    end
    @lecture_course_entries.sort_by(&:created_at)
    @lecture_course_entry = @lecture_course_entries.last
    end

  def set_student_attendance_list
    students = Student.where(Course_id: @lecture_course_entry)
    attended = Attendance.where(Lecture_course_entry_id: @lecture_course_entry)
    attended = attended.where('DATE(created_at) = ?', Date.today)
    attendedStudent = []
    @studentsList = []

    attended.each do |at|
      attendedStudent.push at.Student
    end

    students.each do |s|
      @studentsList.push(s) unless attendedStudent.include?(s)
    end
    @studentsList
end
end
