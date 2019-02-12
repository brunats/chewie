require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers

  test 'index response success' do
    get root_path
    assert_response :success
  end

  test 'new order response success' do
    get new_order_path
    assert_response :success
  end

  test 'delete an order' do
    order = Order.new()
    customer = Customer.create!(name: 'Chewie')
    order.customer = customer
    order.save!

    delete order_path(order)

    assert_response :redirect
    assert Order.all.count.zero?
  end

  test 'create an order' do
    assert Order.all.count.zero?

    customer = Customer.create!(name: 'Chewie')
    post orders_path, params: { order: { customer_id: customer.id } }

    assert_response :redirect
    assert_equal Order.all.count , 1
  end

  test 'edit an order' do
    order = Order.new()
    customer = Customer.create!(name: 'Chewie')
    order.customer = customer
    order.save!

    get edit_order_path(order)

    assert_response :success
  end

  test 'update an order' do
    order = Order.new()
    customer = Customer.create!(name: 'Chewie')
    customer_two = Customer.create!(name: 'Anakin')
    order.customer = customer
    order.save!

    patch order_path(order), params: { order: { customer_id: customer_two.id } }

    assert_response :redirect
    assert_equal order.reload.customer, customer_two
    assert_equal customer_two.reload.orders.first, order
  end
end
