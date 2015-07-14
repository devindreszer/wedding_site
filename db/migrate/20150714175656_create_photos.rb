class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.text :location
      t.text :description
      t.date :date
      t.string :image_url

      t.timestamps
    end
  end
end
