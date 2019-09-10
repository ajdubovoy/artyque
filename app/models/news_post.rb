class NewsPost < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  validates :headline, presence: true

  def next
    self.class.where("id > ?", id).first
  end

  def previous
    self.class.where("id < ?", id).last
  end
end
