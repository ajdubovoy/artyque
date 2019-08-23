class NewsPost < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  validates :headline, presence: true
end
