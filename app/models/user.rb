class User < ApplicationRecord
  has_many :resources
  has_many :favorites
  has_many :resources, through: :favorites

  validates :first_name, :last_name, :email, :type, presence: true
  validates :email, uniqueness: true

  has_secure_password
end
