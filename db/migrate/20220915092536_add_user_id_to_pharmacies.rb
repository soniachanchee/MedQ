class AddUserIdToPharmacies < ActiveRecord::Migration[7.0]
  def change
    add_reference :pharmacies, :user, null: false, foreign_key: true
  end
end
