class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.references :user, foreign_key: true
      t.integer :color_palette
      t.integer :shape
      t.string :super_title
      t.string :title
      t.string :description
      t.string :button_text
      t.integer :layout
      t.string :video
      t.string :quotation
      t.string :quotation_caption
      t.string :photo
      t.string :about_me

      t.timestamps
    end
  end
end
