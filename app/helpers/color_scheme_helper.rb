module ColorSchemeHelper
  def cs(scheme)
    return case scheme
    when 1 then %w(beige white blue dark-blue)
    when 2 then %w(gold pink beige dark-blue)
    when 3 then %w(dark-blue white beige gold)
    else %w(beige white blue dark-blue)
    end
  end
end
