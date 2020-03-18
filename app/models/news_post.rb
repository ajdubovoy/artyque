class NewsPost < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  validates :headline, presence: true
  default_scope { order(created_at: :desc) }

  def next
    self.class.find_by("created_at < ?", created_at)
  end

  def previous
    self.class.where("created_at > ?", created_at).last
  end
end
