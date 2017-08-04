class AddProfileImageNameToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :profile_image_name, :string
  end
end
