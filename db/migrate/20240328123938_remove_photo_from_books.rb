class RemovePhotoFromBooks < ActiveRecord::Migration[7.1]
  def change
    remove_column :books, :photo, :string
    add_column :books, :book_cover, :string
  end
end
