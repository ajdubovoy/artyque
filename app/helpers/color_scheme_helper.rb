module ColorSchemeHelper
  def cs(scheme, index = 1, mode = '')
    colors = case scheme
    when 1 then %w(beige white blue dark-blue)
    when 2 then %w(gold pink beige dark-blue)
    when 3 then %w(dark-blue white beige gold)
    else %w(beige white blue dark-blue)
    end

    selected_color = colors[index - 1]

    return case mode
    when :fg then "color-#{selected_color}"
    when :bg then "background-#{selected_color}"
    when :color then selected_color
    else colors
    end
  end
end
