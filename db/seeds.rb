# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

Stock.destroy_all

Medicine.destroy_all

Message.destroy_all

Chatroom.destroy_all

Pharmacy.destroy_all


pharmacy1 = Pharmacy.new(name: "Forme", address: "Moka")
pharmacy1.save

pharmacy2 = Pharmacy.new(name: "Pharma2", address: "Moka")
pharmacy2.save

pharmacy3 = Pharmacy.new(name: "Pharma3", address: "St Pierre")
pharmacy3.save

p pharmacy1

# doliprane = Medicine.new(name: "doliprane", prescription: false, price: 100)
# doliprane.save

# p doliprane

# p doliprane.name

stock_of_pharmacy1 = Stock.new(pharmacy_id: pharmacy1.id, medicine_id: doliprane.id, quantity: 4)
stock_of_pharmacy1.save

stock_of_pharmacy2 = Stock.new(pharmacy_id: pharmacy2.id, medicine_id: doliprane.id, quantity: 4)
stock_of_pharmacy2.save


# p pharmacy1.stock

# medicine
file = URI.open("https://res.cloudinary.com/dfrukqags/image/upload/v1662544227/MEDECINE/mustela_sunscreen_giuhlc.jpg")
medicine = Medicine.new(name: "mustela", price: 599)
medicine.photo.attach(io: file, filename: "#{medicine.name}.png", content_type: "image/png")
medicine.save
puts medicine.name

file = URI.open("https://res.cloudinary.com/dfrukqags/image/upload/v1662544285/MEDECINE/voltaren_gel_pqtaaf.jpg")
medicine = Medicine.new(name: "voltaren gel", price: 120)
medicine.photo.attach(io: file, filename: "#{medicine.name}.png", content_type: "image/png")
medicine.save
puts medicine.name

file = URI.open("https://res.cloudinary.com/dfrukqags/image/upload/v1662544285/MEDECINE/ketoplus_gkb3jo.jpg")
medicine = Medicine.new(name: "ketoplus", price: 200)
medicine.photo.attach(io: file, filename: "#{medicine.name}.png", content_type: "image/png")
medicine.save
puts medicine.name

file = URI.open("https://res.cloudinary.com/dfrukqags/image/upload/v1662544229/MEDECINE/alvityl_sommeil_socw0n.png")
medicine = Medicine.new(name: "alvityl sommeil", price: 600)
medicine.photo.attach(io: file, filename: "#{medicine.name}.png", content_type: "image/png")
medicine.save
puts medicine.name

file = URI.open("https://res.cloudinary.com/dfrukqags/image/upload/v1662544229/MEDECINE/duphalac-syrup-850x850_l6gxyo.jpg")
medicine = Medicine.new(name: "duphalac", price: 118)
medicine.photo.attach(io: file, filename: "#{medicine.name}.png", content_type: "image/png")
medicine.save
puts medicine.name

file = URI.open("https://res.cloudinary.com/dfrukqags/image/upload/v1662544228/MEDECINE/PANADOL-BABY-INFANSUSPENSION_zniwhi.jpg")
medicine = Medicine.new(name: "panadol baby suspension", price: 130)
medicine.photo.attach(io: file, filename: "#{medicine.name}.png", content_type: "image/png")
medicine.save
puts medicine.name

file = URI.open("https://res.cloudinary.com/dfrukqags/image/upload/v1662544228/MEDECINE/sargenor-1-g-5ml-solution-buvable_ugwuto.jpg")
medicine = Medicine.new(name: "sargenor ampoules", price: 350)
medicine.photo.attach(io: file, filename: "#{medicine.name}.png", content_type: "image/png")
medicine.save
puts medicine.name

file = URI.open("https://res.cloudinary.com/dfrukqags/image/upload/v1662544228/MEDECINE/brufen_syrup_100ml_rxtygt.jpg")
medicine = Medicine.new(name: "brufen syrup", price: 140)
medicine.photo.attach(io: file, filename: "#{medicine.name}.png", content_type: "image/png")
medicine.save
puts medicine.name

file = URI.open("https://res.cloudinary.com/dfrukqags/image/upload/v1662544228/MEDECINE/sargenor_vit_c_a3i75h.jpg")
medicine = Medicine.new(name: "sargenor vit c ampoule", price: 400)
medicine.photo.attach(io: file, filename: "#{medicine.name}.png", content_type: "image/png")
medicine.save
puts medicine.name

file = URI.open("https://res.cloudinary.com/dfrukqags/image/upload/v1662544228/MEDECINE/spasmopep_k0p1yz.jpg")
medicine = Medicine.new(name: "spasmopep cap", price: 160)
medicine.photo.attach(io: file, filename: "#{medicine.name}.png", content_type: "image/png")
medicine.save
puts medicine.name
