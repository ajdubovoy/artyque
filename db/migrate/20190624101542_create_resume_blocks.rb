class CreateResumeBlocks < ActiveRecord::Migration[5.1]
  def change
    create_table :resume_blocks do |t|
      t.references :artist, foreign_key: true
      t.string :title
      t.integer :position

      t.timestamps
    end
  end
end
