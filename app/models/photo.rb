class Photo < ApplicationRecord
  belongs_to :artwork, inverse_of: :photos
  acts_as_list scope: :artwork
  mount_uploader :attachment, PhotoUploader
end
