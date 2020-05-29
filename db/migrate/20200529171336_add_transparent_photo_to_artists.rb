class AddTransparentPhotoToArtists < ActiveRecord::Migration[5.1]
  def change
    add_column :artists, :transparent_photo, :string
  end
end
