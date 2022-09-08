class Medicine < ApplicationRecord

  has_many :stocks
  has_many :orders

  has_one_attached :photo

end
