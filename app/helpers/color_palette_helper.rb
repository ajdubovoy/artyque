module ColorPaletteHelper
  def cp(palette, index = 1, mode = '')
    colors = case palette
    when 1 then %w(pink white blue dark-blue)
    when 2 then %w(gold pink blue dark-blue)
    when 3 then %w(dark-blue white beige pink)
    else %w(beige white blue dark-blue)
    end

    selected_color = colors[index - 1]

    return case mode
    when :fg then "color-#{selected_color}"
    when :bg then "background-#{selected_color}"
    when :grad then "background-#{selected_color}-gradient"
    when :color then selected_color
    else colors
    end
  end
end
