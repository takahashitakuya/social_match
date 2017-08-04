class AddNamesToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :staff_first_name, :string
    add_column :users, :staff_last_name, :string
  end
end
