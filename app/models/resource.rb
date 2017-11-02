class Resource < ApplicationRecord
  has_many :resource_tags
  has_many :tags, through: :resource_tags
  has_many :favorites
  has_many :fans, through: :favorites
  belongs_to :author, class_name: "User"

  validates :title, :url, :author, presence: true

  # scope :student_available, -> { joins(resource_tags).joins(tags).where('tag.permission = ?', true) }

  def teachers_only?
    !!self.tags.find_by(permission: false)
  end

  def favorites_count
    self.fans.count
  end

end
