require 'test_helper'

class OrderProductTest < ActiveSupport::TestCase
  setup do
    @customer = Customer.create!(name: 'Chewie')
    @order = Order.create!(customer: @customer)
    @product = Product.create!(
      name: 'Lightsaber',
      price: 15_000,
      multiple: 1
    )

    @order_product = OrderProduct.new(units: 2, unit_price: 13_500, order: @order, product: @product)
  end

  test 'belongs to order' do
    @order_product.order = nil
    assert_not @order_product.save
    assert_equal @order_product.errors[:order], ['é obrigatório(a)']

    @order_product.order = @order
    assert @order_product.save
  end

  test 'belongs to product' do
    @order_product.product = nil
    assert_not @order_product.save
    assert_equal @order_product.errors[:product], ['é obrigatório(a)']

    @order_product.product = @product
    assert @order_product.save
  end

  test 'great sale' do
    assert_not @order_product.great_sale?
    @order_product.update(unit_price: 16_000)
    assert @order_product.great_sale?
  end

  test 'round 2' do
    @product.update!(price: 3.14)
    @order_product.update!(unit_price: 3.14159265)
    assert_equal @order_product.unit_price, 3.14
  end
end
