class CreateArtworks < ActiveRecord::Migration[5.1]
  def change
    create_table :artworks do |t|
      t.references :collection, foreign_key: true
      t.string :name
      t.string :description
      t.integer :width
      t.integer :height
      t.integer :depth
      t.integer :year
      t.string :medium
      t.integer :price
      t.integer :weight
      t.boolean :highlight

      t.timestamps
    end
  end
end
