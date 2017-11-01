class Resource < ApplicationRecord
  has_many :resource_tags
  has_many :tags, through: :resource_tags
  belongs_to :author, class_name: "User"
  has_many :favorites
  has_many :fans, through: :favorites

end
