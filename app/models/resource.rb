class Resource < ApplicationRecord
  has_many :resource_tags
  has_many :tags, through: :resource_tags
  has_many :favorites
  has_many :fans, through: :favorites
  belongs_to :author, class_name: "User"

  validates :title, :url, :author, presence: true

  # Resource.joins(ResourceTag.joins(:tag).where("tags.permission = false").group(:resource_id).count).where((:resource_id).count = 0)

  def self.resources_by_tags(tag)
    tagged = Resource.joins(:tags).where( tags: { name: tag } )
  end

  # Can be refactored
  # def self.resources_by_tag(tag)
  #   tag_obj = Tag.find_by(name: tag)
  #   filtered = Resource.all.reduce(Array.new) do |arr, resource|
  #     if resource.tags.include?(tag_obj)
  #       arr << resource
  #     end
  #   end
  #   filtered
  # end

  #Can be refactored
  def teachers_only?
    !!self.tags.find_by(permission: false)
  end

  def favorites_count
    self.fans.count
  end

end
