class Order < ApplicationRecord
  belongs_to :pharmacy
  belongs_to :user
  belongs_to :medicine

  validates :quantity, presence: true
  validates_inclusion_of :delivery, :in => [true, false]
end
