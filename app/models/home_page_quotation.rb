class HomePageQuotation < ApplicationRecord
  def self.access
    if self.count < 1
      @home_page_quotation = self.create
    else
      @home_page_quotation = self.first
    end
  end

  def formatted_quotation
    return "\"#{quotation}\""
  end

  def formatted_caption
    return "- #{caption}"
  end
end
