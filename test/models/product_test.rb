require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  setup do
    @product = Product.new(name: 'R2D2', price: 2, multiple: 4)
  end

  test 'invalid without name' do
    @product.name = ''
    assert @product.invalid?
    assert_equal @product.errors[:name], ["can't be blank"]
  end

  test 'uniqueness name' do
    Product.create!(name: 'R2D2')
    assert_equal 1, Product.all.count

    assert @product.invalid?
    assert_equal @product.errors[:name], ['has already been taken']
  end

  test 'price presence' do
    @product.price = nil
    assert @product.invalid?
    assert_equal @product.errors[:price], ["can't be blank"]
  end

  test 'multiple presence' do
    @product.multiple = nil
    assert @product.invalid?
    assert_equal @product.errors[:multiple], ["can't be blank"]
  end

  test 'has many order products' do
    @product.save!
    customer = Customer.create!(name: 'Chewie')
    order = Order.create!(customer: customer)
    order_products = [
      OrderProduct.create!(
        units: 2,
        unit_price: 4,
        product: @product,
        order: order
      ),
      OrderProduct.create!(
        units: 2,
        unit_price: 4,
        product: @product,
        order: order
      )
    ]
    assert_equal @product.order_products, order_products
  end
end
