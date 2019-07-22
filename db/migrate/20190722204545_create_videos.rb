class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.references :artwork, foreign_key: true
      t.string :url
      t.integer :position

      t.timestamps
    end
  end
end
