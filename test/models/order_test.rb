require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  setup do
    @order = Order.new()
    @customer = Customer.create!(name: 'Chewie')
  end

  test 'belongs to customer' do
    assert_not @order.save
    assert_equal @order.errors[:customer], ['must exist']
    @order.customer = @customer
    assert @order.save
  end

  test 'has many order products' do
    @order.customer = @customer
    @order.save!

    assert_equal @order.order_products, []

    product = Product.create!(
      name: 'Lightsaber',
      price: 15_000,
      multiple: 1
    )

    order_product = OrderProduct.create!(
      units: 5,
      unit_price: 3.14,
      order: @order,
      product: product
    )

    assert_equal @order.reload.order_products, [order_product]
    assert_equal product.order_products, [order_product]
  end
end
