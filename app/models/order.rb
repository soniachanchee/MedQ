class Order < ApplicationRecord
  belongs_to :pharmacy
  belongs_to :user
  belongs_to :medicine
end
