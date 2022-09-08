class Medicine < ApplicationRecord
  has_many :stocks
  has_many :orders
end
