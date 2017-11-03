class Favorite < ApplicationRecord
  belongs_to :fan, class_name: "User"
  belongs_to :resource

  validates :fan_id, :resource_id, presence: true
end
