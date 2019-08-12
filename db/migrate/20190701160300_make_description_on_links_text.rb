class MakeDescriptionOnLinksText < ActiveRecord::Migration[5.1]
  def change
    change_column :links, :description, :text
  end
end
