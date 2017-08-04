class AddPublishToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :publish, :boolean
  end
end
