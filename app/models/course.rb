class Course < ApplicationRecord
  belongs_to :Teacher
  has_many :Students
  has_many :lecture_courses
end
