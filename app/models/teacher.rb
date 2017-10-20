class Teacher < ApplicationRecord
  belongs_to :User
  has_many :Lectures
end
