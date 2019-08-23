class CreateNewsPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :news_posts do |t|
      t.string :headline
      t.text :content
      t.string :photo

      t.timestamps
    end
  end
end
