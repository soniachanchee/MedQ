class CreateMedicines < ActiveRecord::Migration[7.0]
  def change
    create_table :medicines do |t|
      t.string :name
      t.boolean :prescription
      t.string :tags
      t.integer :price
      t.string :image_url

      t.timestamps
    end
  end
end
