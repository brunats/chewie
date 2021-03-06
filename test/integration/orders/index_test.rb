require 'test_helper'

module Orders
  class IndexTest < ActionDispatch::IntegrationTest
    include Capybara::DSL

    test 'index page must have navbar' do
      Capybara.current_driver = Capybara.javascript_driver
      index_page.visit
      assert index_page.shown?
      assert index_page.has_navbar?
    end

    test 'navbar has Chewie Store' do
      Capybara.current_driver = Capybara.javascript_driver
      index_page.visit
      assert_equal index_page.navbar_title, 'Chewie Store'
    end

    test 'delete order' do
      Capybara.current_driver = Capybara.javascript_driver

      order = Order.new()
      customer = Customer.create!(name: 'Chewie')
      order.customer = customer
      order.save!

      index_page.visit
      assert index_page.has_order?(order)

      index_page.click_on_delete_order(order)

      assert index_page.has_alert?
      assert_equal index_page.alert_text, 'Removido com sucesso'
    end

    private

    def index_page
      @index_page ||= Pages::Orders::Index.new(page)
    end
  end
end
