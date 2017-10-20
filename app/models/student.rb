class Student < ApplicationRecord
  belongs_to :Parent
  belongs_to :Course
  has_many :Notes
  has_many :Grades
end
