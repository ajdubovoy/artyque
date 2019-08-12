class AddFeaturedArtworkToArtists < ActiveRecord::Migration[5.1]
  def change
    add_reference :artists, :featured_artwork, references: :artworks, index: true
    add_foreign_key :artists, :artworks, column: :featured_artwork_id
  end
end
