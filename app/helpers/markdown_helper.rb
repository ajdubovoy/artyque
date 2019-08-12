module MarkdownHelper
  def md(text)
    return BlueCloth.new(text).to_html.html_safe
  end
end
