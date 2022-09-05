class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :pharmacy, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :medicine, null: false, foreign_key: true
      t.boolean :delivery
      t.boolean :delivered
      t.integer :total_price

      t.timestamps
    end
  end
end
