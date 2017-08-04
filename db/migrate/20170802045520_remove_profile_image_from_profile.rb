class RemoveProfileImageFromProfile < ActiveRecord::Migration[5.1]
  def change
    remove_column :profiles, :profile_image, :binary
  end
end
