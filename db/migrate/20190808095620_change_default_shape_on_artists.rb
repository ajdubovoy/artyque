class ChangeDefaultShapeOnArtists < ActiveRecord::Migration[5.1]
  def change
    change_column_default :artists, :shape, 0
  end
end
