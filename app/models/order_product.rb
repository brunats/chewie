class OrderProduct < ApplicationRecord
  validates :units, presence: true
  has_one :order
  has_one :product
end
