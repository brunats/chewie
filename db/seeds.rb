Customer.create!(name: 'Darth ​Vader')
Customer.create!(name: 'Obi-Wan ​Kenobi')
Customer.create!(name: 'Luke ​Skywalker')
Customer.create!(name: 'Imperador ​Palpatine')
Customer.create!(name: 'Han ​Solo')

Product.create!(name: 'Millenium ​Falcon', price: 550000.0, multiple: 0)
Product.create!(name: 'X-Wing', price: 60000.0, multiple: 2)
Product.create!(name: 'Super ​Star ​Destroyer', price: 4570000.0, multiple: 0)
Product.create!(name: 'TIE ​Fighter', price: 75000.0, multiple: 2)
Product.create!(name: 'Lightsaber', price: 6000.0, multiple: 5)
Product.create!(name: 'DLT-19 ​Heavy ​Blaster ​Rifle', price: 5800.0, multiple: 0)
Product.create!(name: 'DL-44 ​Heavy ​Blaster ​Pistol', price: 1500.0, multiple: 10)


Order.create!(
  customer: Customer.first,
  order_products: [
    OrderProduct.new(
      units: 2,
      unit_price: Product.first.price,
      product: Product.first
    )
  ]
)
