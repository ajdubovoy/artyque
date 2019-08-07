class AddPositionToArtworks < ActiveRecord::Migration[5.1]
  def change
    add_column :artworks, :position, :integer
  end
end
