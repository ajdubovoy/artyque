class ChangeDefaultColorPaletteOnArtists < ActiveRecord::Migration[5.1]
  def change
    change_column_default :artists, :color_palette, 1
  end
end
