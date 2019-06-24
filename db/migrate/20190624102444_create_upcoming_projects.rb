class CreateUpcomingProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :upcoming_projects do |t|
      t.references :artist, foreign_key: true
      t.string :title
      t.string :description
      t.string :location
      t.string :date
      t.string :photo

      t.timestamps
    end
  end
end
