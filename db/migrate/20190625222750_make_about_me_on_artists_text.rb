class MakeAboutMeOnArtistsText < ActiveRecord::Migration[5.1]
  def change
    change_column :artists, :about_me, :text
  end
end
