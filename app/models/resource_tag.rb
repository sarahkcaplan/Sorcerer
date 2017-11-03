class ResourceTag < ApplicationRecord
  belongs_to :tag
  belongs_to :resource

  validates_uniqueness_of :tag_id, :scope => [:resource_id]

end
