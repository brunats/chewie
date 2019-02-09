class Order < ApplicationRecord
  has_one :customer
  has_many :order_product
end
