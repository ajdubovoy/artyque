class ChangeDescriptionOnArtworksToText < ActiveRecord::Migration[5.1]
  def change
    change_column :artworks, :description, :text
  end
end
