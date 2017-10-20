class LectureCourse < ApplicationRecord
  belongs_to :Course
  belongs_to :Lecture
  has_many :lecture_course_entries
end
