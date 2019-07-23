class Video < ApplicationRecord
  belongs_to :artwork
  acts_as_list scope: :artwork
  validates :url, format: /\Ahttps?:\/\/((www\.)?vimeo\.com\/|(www\.)?youtu\.be\/|(www\.)?youtube\.com\/watch\?v=)(?<id>.+)\z/

  def vimeo?
    return url.match?(/\Ahttps?:\/\/(www\.)?vimeo\.com\/(?<id>.+)\z/)
  end

  def type
    return vimeo? ? :vimeo : :youtube
  end

  def youtube?
    return !vimeo?
  end
end
