class RemoveCoverImageFromProfile < ActiveRecord::Migration[5.1]
  def change
    remove_column :profiles, :cover_image, :binary
  end
end
