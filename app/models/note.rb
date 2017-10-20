class Note < ApplicationRecord
  belongs_to :Student
  belongs_to :Lecture_course
end
