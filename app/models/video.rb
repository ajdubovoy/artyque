class Video < ApplicationRecord
  belongs_to :artwork
  acts_as_list scope: :artwork
  validates :url, format: /\Ahttps?:\/\/((www\.)?vimeo\.com\/|(www\.)?youtu\.be\/|(www\.)?youtube\.com\/watch\?v=)(?<id>.+)\z/
end
