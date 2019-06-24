class CreateCollections < ActiveRecord::Migration[5.1]
  def change
    create_table :collections do |t|
      t.references :artist, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
