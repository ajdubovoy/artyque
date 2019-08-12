class Photo < ApplicationRecord
  belongs_to :artwork
  acts_as_list scope: :artwork
  mount_uploader :attachment, PhotoUploader
end
