class CreateStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :stocks do |t|
      t.references :pharmacy, null: false, foreign_key: true
      t.references :medicine, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
