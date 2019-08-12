class MakeDescriptionOnArtistsText < ActiveRecord::Migration[5.1]
  def change
    change_column :artists, :description, :text
  end
end
