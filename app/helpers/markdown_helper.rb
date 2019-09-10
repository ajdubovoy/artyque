module MarkdownHelper
  def md(text)
    return BlueCloth.new(text).to_html.html_safe
  end

  def md_flat(text)
    # Return text but with no tags or anything; useful for previews
    return strip_tags(md(text))
  end
end
