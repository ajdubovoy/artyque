class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.references :artist, foreign_key: true
      t.string :title
      t.string :description
      t.string :url
      t.integer :year
      t.string :photo

      t.timestamps
    end
  end
end
