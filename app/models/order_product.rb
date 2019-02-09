class OrderProduct < ApplicationRecord
  validates :units, presence: true
  belongs_to :order
  belongs_to :product
end
