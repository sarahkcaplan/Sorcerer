class Favorite < ApplicationRecord
  belongs_to :fan, class_name: "User"
  belongs_to :resource

end
