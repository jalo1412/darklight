class Grade < ApplicationRecord
  belongs_to :Evaluation
  belongs_to :Student
end
