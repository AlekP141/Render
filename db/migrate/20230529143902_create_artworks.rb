class CreateArtworks < ActiveRecord::Migration[7.0]
  def change
    create_table :artworks do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :price
      t.text :address
      t.text :description
      t.float :average_rating
      t.integer :height
      t.integer :width

      t.timestamps
    end
  end
end
