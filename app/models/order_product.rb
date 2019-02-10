class OrderProduct < ApplicationRecord
  validates :units, presence: true, numericality: { greater_than: 0 }
  validates :unit_price, presence: true, numericality: { greater_than: 0 }
  belongs_to :order
  belongs_to :product
end
