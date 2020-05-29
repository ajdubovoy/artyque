class AddSlugToArtists < ActiveRecord::Migration[5.1]
  def change
    add_column :artists, :slug, :string
    add_index :artists, :slug, unique: true
    Artist.all.each { |artist| artist.save }
  end
end
