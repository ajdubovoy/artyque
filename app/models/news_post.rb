class NewsPost < ApplicationRecord
  mount_uploader :photo, PhotoUploader
end
