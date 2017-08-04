class AddFormatToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :format, :string
  end
end
