class UpcomingProject < ApplicationRecord
  belongs_to :artist
  validates_with DescriptionWordLengthValidator
  validates :title, presence: true
  mount_uploader :photo, PhotoUploader
end
