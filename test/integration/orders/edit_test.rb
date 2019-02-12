require 'test_helper'

module Orders
  class EditTest < ActionDispatch::IntegrationTest
    include Capybara::DSL

    setup do
      @customer = Customer.create!(name: 'Chewie')
      @order = Order.create!(customer: @customer)
      @product = Product.create!(name: 'Lightsaber', price: 15_000, multiple: 1)
      @product_two = Product.create!(name: 'R2D2', price: 2.50, multiple: 2)
    end

    test 'shown edit order page' do
      Capybara.current_driver = Capybara.javascript_driver
      edit_page.visit(@order)
      assert edit_page.shown?(@order)
    end

    test 'edit an order' do
      Capybara.current_driver = Capybara.javascript_driver
      edit_page.visit(@order)

      edit_page.select_product(@product)
      edit_page.fill_in_product_price(15_500)
      edit_page.fill_in_product_unit(2)
      edit_page.click_on_add

      assert_equal @order.reload.order_products.count, 1

      assert edit_page.shown?(@order)
    end

    test 'delete an order' do
      @order_product = OrderProduct.create!(
        units: 2,
        unit_price: 13_500,
        order: @order,
        product: @product
      )
      @order_product_two = OrderProduct.create!(
        units: 2,
        unit_price: 50_000,
        order: @order,
        product: @product_two
      )

      Capybara.current_driver = Capybara.javascript_driver
      edit_page.visit(@order)

      assert edit_page.click_on_delete(@order_product_two)
      assert OrderProduct.count, 1
    end

    private

    def index_page
      @index_page ||= Pages::Orders::Index.new(page)
    end

    def edit_page
      @edit_page ||= Pages::Orders::Edit.new(page)
    end
  end
end
