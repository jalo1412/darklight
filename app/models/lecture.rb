class Lecture < ApplicationRecord
  belongs_to :Teacher
  has_many :Lecture_courses
end
