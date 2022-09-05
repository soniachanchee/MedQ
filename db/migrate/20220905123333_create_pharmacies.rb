class CreatePharmacies < ActiveRecord::Migration[7.0]
  def change
    create_table :pharmacies do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :link
      t.string :image_url
      t.time :opening_hours

      t.timestamps
    end
  end
end
