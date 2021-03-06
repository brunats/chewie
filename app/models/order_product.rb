class OrderProduct < ApplicationRecord
  validates :units, presence: true, numericality: { greater_than: 0 }
  validates :unit_price, presence: true, numericality: { greater_than: 0 }

  validates_with MinimumPriceValidator
  validates_with MultipleUnitValidator

  belongs_to :order
  belongs_to :product

  def great_sale?
    unit_price > product.price
  end

  def unit_price=(raw)
    super(raw.to_s.gsub(',', '').to_f.round(2))
  end
end
