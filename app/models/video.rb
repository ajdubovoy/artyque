class Video < ApplicationRecord
  belongs_to :artwork
  acts_as_list scope: :artwork
  validates :url, format: /\Ahttps:\/\/vimeo\.com\/\d+\Z/
end
