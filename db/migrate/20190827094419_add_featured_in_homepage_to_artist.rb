class AddFeaturedInHomepageToArtist < ActiveRecord::Migration[5.1]
  def change
  	 add_column :artworks, :homepage_featured, :boolean, default: false
  end
end
