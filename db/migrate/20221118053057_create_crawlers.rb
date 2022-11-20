class CreateCrawlers < ActiveRecord::Migration[7.0]
  def change
    create_table :crawlers do |t|
      t.string :url
      t.string :title
      t.integer :price
      t.string :size
      t.float :stars
      t.string :seller
      t.string :category
      t.string :img_url
      
      t.timestamps
    end
  end
end
