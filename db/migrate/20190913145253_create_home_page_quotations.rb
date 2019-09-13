class CreateHomePageQuotations < ActiveRecord::Migration[5.1]
  def change
    create_table :home_page_quotations do |t|
      t.string :quotation
      t.string :caption

      t.timestamps
    end
  end
end
