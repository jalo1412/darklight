class Parent < ApplicationRecord
  belongs_to :User
  has_many :students
end
