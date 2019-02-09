class Customer < ApplicationRecord
  validates :name, presence: true, length: { in: 4..24 }, uniqueness: true
  has_many :order
end
