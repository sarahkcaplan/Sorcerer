class User < ApplicationRecord
  has_many :resources
  has_many :favorites
  # has_many :resources, through: :favorites, {where type: "student"}

  validates :first_name, :last_name, :email, :user_type, presence: true
  validates :email, uniqueness: true

  has_secure_password
end
