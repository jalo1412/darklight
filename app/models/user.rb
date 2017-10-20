class User < ApplicationRecord
  belongs_to :Type_of_user
  validates :name, presence: true, uniqueness: true
  has_secure_password
end
