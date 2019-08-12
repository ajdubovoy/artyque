module VideoHelper
  def video_embed(url, options = {})
    validator = /\Ahttps?:\/\/((www\.)?vimeo\.com\/|(www\.)?youtu\.be\/|(www\.)?youtube\.com\/watch\?v=)(?<id>.+)\Z/
    url_match = validator.match url
    video_id = url_match[:id]
    if vimeo? url
      "<iframe class='embed-responsive-item #{options[:class]}' src='https://player.vimeo.com/video/#{video_id}' allowfullscreen></iframe>".html_safe
    else
      "<iframe class='embed-responsive-item #{options[:class]}' src='https://www.youtube.com/embed/#{video_id}' allowfullscreen></iframe>"
    end
  end

  private

  def vimeo?(url)
    return url.match?(/\Ahttps?:\/\/(www\.)?vimeo\.com\/(?<id>.+)\z/)
  end
end
