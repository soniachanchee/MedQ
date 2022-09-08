class Medicine < ApplicationRecord

  has_many :stocks, dependent: :destroy
  has_many :orders, dependent: :destroy

  has_one_attached :photo

end
