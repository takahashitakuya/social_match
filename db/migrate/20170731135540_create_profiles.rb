class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :display_name
      t.text :description
      t.text :policy
      t.string :catch_copy
      t.binary :profile_image
      t.binary :cover_image
      t.text :content
      t.string :staff_lastname
      t.string :staff_firstname
      t.string :tel
      t.string :fax
      t.string :website
      t.string :postal_code
      t.string :address_pref
      t.string :address_city
      t.string :address_number
      t.string :address_building
      t.string :address_full

      t.timestamps
    end
  end
end
