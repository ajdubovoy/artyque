class CreateResumeItems < ActiveRecord::Migration[5.1]
  def change
    create_table :resume_items do |t|
      t.references :resume_block, foreign_key: true
      t.string :description
      t.string :label
      t.string :year
      t.boolean :highlight
      t.integer :position

      t.timestamps
    end
  end
end
