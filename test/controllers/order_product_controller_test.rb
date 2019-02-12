require 'test_helper'

class OrderProductControllerTest < ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers

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

  test 'edit an order product' do
    assert @order_product.save
    get edit_order_product_path(@order_product)
    assert_response :success
  end

  test 'update an order product' do
    assert @order_product.save
    product_two = Product.create!(
      name: 'C3PO',
      price: 150_000,
      multiple: 1
    )
    patch order_product_path(@order_product), params: {
      order_product: {
        units: 4,
        unit_price: 150_000,
        product_id: product_two.id
        }
      }
    assert_response :redirect
    assert_equal @order_product.reload.units, 4
    assert_equal @order_product.unit_price, 150_000
    assert_equal @order_product.product, product_two
    assert @product.order_products.count.zero?
    assert_equal product_two.order_products.first, @order_product
  end

  test 'create an order product' do
    assert OrderProduct.count.zero?
    post order_product_index_path, params: {
      order_id: @order.id,
      order_product: {
        product_id: @product.id,
        units: @product.multiple,
        unit_price: @product.price
        }
      }
    assert_response :redirect
    assert_equal OrderProduct.count, 1
  end

  test 'destroy an order product' do
    assert @order_product.save
    delete order_product_path(@order_product, order_id: @order.id)
    assert_response :redirect
    assert OrderProduct.count.zero?
  end
end
