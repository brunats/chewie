class OrderProduct < ApplicationRecord
  validates :units, presence: true
  validates :unit_price, presence: true
  belongs_to :order
  belongs_to :product
end
