# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

require "open-uri"

Stock.destroy_all

Medicine.destroy_all

Message.destroy_all

Chatroom.destroy_all

Pharmacy.destroy_all

# pharmacy
pharmacy1 = Pharmacy.new(name: "Forme", address: "Moka, Mauritius")
pharmacy1.save

pharmacy2 = Pharmacy.new(name: "Pharma2", address: "Moka, Mauritius")
pharmacy2.save

pharmacy3 = Pharmacy.new(name: "Pharma3", address: "St Pierre")
pharmacy3.save

# medicine
file = URI.open("https://res.cloudinary.com/dfrukqags/image/upload/v1662544227/MEDECINE/mustela_sunscreen_giuhlc.jpg")
medicine1 = Medicine.new(name: "mustela", price: 599)
medicine1.photo.attach(io: file, filename: "#{medicine1.name}.png", content_type: "image/png")
medicine1.save
puts medicine1.name

file = URI.open("https://res.cloudinary.com/dfrukqags/image/upload/v1662544285/MEDECINE/voltaren_gel_pqtaaf.jpg")
medicine2 = Medicine.new(name: "voltaren gel", price: 120)
medicine2.photo.attach(io: file, filename: "#{medicine2.name}.png", content_type: "image/png")
medicine2.save
puts medicine2.name

file = URI.open("https://res.cloudinary.com/dfrukqags/image/upload/v1662544285/MEDECINE/ketoplus_gkb3jo.jpg")
medicine3 = Medicine.new(name: "ketoplus", price: 200)
medicine3.photo.attach(io: file, filename: "#{medicine3.name}.png", content_type: "image/png")
medicine3.save
puts medicine3.name

file = URI.open("https://res.cloudinary.com/dfrukqags/image/upload/v1662544229/MEDECINE/alvityl_sommeil_socw0n.png")
medicine4 = Medicine.new(name: "alvityl sommeil", price: 600)
medicine4.photo.attach(io: file, filename: "#{medicine4.name}.png", content_type: "image/png")
medicine4.save
puts medicine4.name

file = URI.open("https://res.cloudinary.com/dfrukqags/image/upload/v1662544229/MEDECINE/duphalac-syrup-850x850_l6gxyo.jpg")
medicine5 = Medicine.new(name: "duphalac", price: 118)
medicine5.photo.attach(io: file, filename: "#{medicine5.name}.png", content_type: "image/png")
medicine5.save
puts medicine5.name

file = URI.open("https://res.cloudinary.com/dfrukqags/image/upload/v1662544228/MEDECINE/PANADOL-BABY-INFANSUSPENSION_zniwhi.jpg")
medicine6 = Medicine.new(name: "panadol baby suspension", price: 130)
medicine6.photo.attach(io: file, filename: "#{medicine6.name}.png", content_type: "image/png")
medicine6.save
puts medicine6.name

file = URI.open("https://res.cloudinary.com/dfrukqags/image/upload/v1662544228/MEDECINE/sargenor-1-g-5ml-solution-buvable_ugwuto.jpg")
medicine7 = Medicine.new(name: "sargenor ampoules", price: 350)
medicine7.photo.attach(io: file, filename: "#{medicine7.name}.png", content_type: "image/png")
medicine7.save
puts medicine7.name

file = URI.open("https://res.cloudinary.com/dfrukqags/image/upload/v1662544228/MEDECINE/brufen_syrup_100ml_rxtygt.jpg")
medicine8 = Medicine.new(name: "brufen syrup", price: 140)
medicine8.photo.attach(io: file, filename: "#{medicine8.name}.png", content_type: "image/png")
medicine8.save
puts medicine8.name

file = URI.open("https://res.cloudinary.com/dfrukqags/image/upload/v1662544228/MEDECINE/sargenor_vit_c_a3i75h.jpg")
medicine9 = Medicine.new(name: "sargenor vit c ampoule", price: 400)
medicine9.photo.attach(io: file, filename: "#{medicine9.name}.png", content_type: "image/png")
medicine9.save
puts medicine9.name

file = URI.open("https://res.cloudinary.com/dfrukqags/image/upload/v1662544228/MEDECINE/spasmopep_k0p1yz.jpg")
medicine10 = Medicine.new(name: "spasmopep cap", price: 160)
medicine10.photo.attach(io: file, filename: "#{medicine10.name}.png", content_type: "image/png")
medicine10.save
puts medicine10.name

file = URI.open("https://res.cloudinary.com/dfrukqags/image/upload/v1662544229/MEDECINE/alvityl_sommeil_socw0n.png")
doliprane = Medicine.new(name: "DOLIPRANE", prescription: false, price: 100)
doliprane.photo.attach(io: file, filename: "#{medicine4.name}.png", content_type: "image/png")
doliprane.save

file = URI.open("https://res.cloudinary.com/dfrukqags/image/upload/v1662544228/MEDECINE/PANADOL-BABY-INFANSUSPENSION_zniwhi.jpg")
doliprane1000 = Medicine.new(name: "DOLIPRANE 1000mg", prescription: false, price: 250)
doliprane1000.photo.attach(io: file, filename: "#{medicine6.name}.png", content_type: "image/png")
doliprane1000.save

file = URI.open("https://res.cloudinary.com/dfrukqags/image/upload/v1662544228/MEDECINE/spasmopep_k0p1yz.jpg")
spasfon = Medicine.new(name: "SPASFON", prescription: false, price: 300)
spasfon.photo.attach(io: file, filename: "#{medicine10.name}.png", content_type: "image/png")
spasfon.save

# stock
stock1_pharma1 = Stock.new(pharmacy_id: pharmacy1.id, medicine_id: doliprane.id, quantity: 0)
stock1_pharma1.save

stock2_pharma1 = Stock.new(pharmacy_id: pharmacy1.id, medicine_id: doliprane1000.id, quantity: 4)
stock2_pharma1.save

stock3_pharma1 = Stock.new(pharmacy_id: pharmacy1.id, medicine_id: spasfon.id, quantity: 9)
stock3_pharma1.save

stock1_pharma2 = Stock.new(pharmacy_id: pharmacy2.id, medicine_id: doliprane.id, quantity: 2)
stock1_pharma2.save

stock2_pharma2 = Stock.new(pharmacy_id: pharmacy2.id, medicine_id: spasfon.id, quantity: 3)
stock2_pharma2.save
chatroom1 = Chatroom.new(name: "naz")
chatroom1.save

chatroom2 = Chatroom.new(name: "sonia")
chatroom2.save
