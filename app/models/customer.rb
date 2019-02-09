class Customer < ApplicationRecord
  validates :name, presence: true, length: { in: 4..24 }
end
