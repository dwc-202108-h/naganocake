class AddColumnGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :image_id, :string
  end
end
