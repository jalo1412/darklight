class Attendance < ApplicationRecord
  belongs_to :Status_of_attendance
  belongs_to :Lecture_course_entry
  belongs_to :Student
end
