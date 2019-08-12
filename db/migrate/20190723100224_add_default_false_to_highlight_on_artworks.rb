class AddDefaultFalseToHighlightOnArtworks < ActiveRecord::Migration[5.1]
  def change
    change_column_default :artworks, :highlight, false
  end
end
