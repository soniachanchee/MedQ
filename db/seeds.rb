# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Stock.destroy_all

Medicine.destroy_all

Pharmacy.destroy_all

pharmacy1 = Pharmacy.new(name: "Forme", address: "Moka")
pharmacy1.save

pharmacy2 = Pharmacy.new(name: "Pharma2", address: "Moka")
pharmacy2.save

pharmacy3 = Pharmacy.new(name: "Pharma3", address: "St Pierre")
pharmacy3.save

p pharmacy1

doliprane = Medicine.new(name: "doliprane", prescription: false, price: 100)
doliprane.save

p doliprane

p doliprane.name

stock_of_pharmacy1 = Stock.new(pharmacy_id: pharmacy1.id, medicine_id: doliprane.id, quantity: 4)
stock_of_pharmacy1.save

stock_of_pharmacy2 = Stock.new(pharmacy_id: pharmacy2.id, medicine_id: doliprane.id, quantity: 4)
stock_of_pharmacy2.save

# p pharmacy1.stock
