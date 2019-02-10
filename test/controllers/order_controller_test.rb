require 'test_helper'

class OrderControllerTest < ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers

  test 'index response success' do
    get root_path
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
end
