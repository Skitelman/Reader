class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.integer :feed_id
      t.string :title
      t.string :url, null: false
      t.datetime :published_at
      t.string :author
      t.text :summary
      t.text :content
      t.string :image_url
    end
  end
end
