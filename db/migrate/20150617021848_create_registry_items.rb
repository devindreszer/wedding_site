class CreateRegistryItems < ActiveRecord::Migration
  def change
    create_table :registry_items do |t|
      t.string :name
      t.text :description
      t.decimal :price, :precision => 8, :scale => 2
      t.integer :quantity
      t.boolean :purchased
      t.string :retailer
      t.string :image_url
      t.string :link
      t.integer :ranking
      t.references :user, index: true

      t.timestamps
    end
  end
end
