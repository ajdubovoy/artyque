class AddFeaturedInHomepageToArtworks < ActiveRecord::Migration[5.1]
  def change
  	add_column :artists, :homepage_featured, :boolean, default: false
  end
end
