class Pharmacy < ApplicationRecord
  has_many :stocks
  has_many :medicines, through: :stock
  has_many :orders
end
