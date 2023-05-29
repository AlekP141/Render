class AddNameToArtworks < ActiveRecord::Migration[7.0]
  def change
    add_column :artworks, :name, :string
  end
end
