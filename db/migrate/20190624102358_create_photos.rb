class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.references :artwork, foreign_key: true
      t.string :attachment
      t.integer :position

      t.timestamps
    end
  end
end
