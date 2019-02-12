require 'test_helper'

module Orders
  class NewTest < ActionDispatch::IntegrationTest
    include Capybara::DSL

    setup do
      @customer = Customer.create!(name: 'Chewie')
    end

    test 'shown new order page' do
      Capybara.current_driver = Capybara.javascript_driver
      new_page.visit
      assert new_page.shown?
    end

    test 'create a new order' do
      other_customer = Customer.create!(name: 'Solo')

      Capybara.current_driver = Capybara.javascript_driver

      assert Order.count.zero?

      new_page.visit
      new_page.select_customer(other_customer)
      new_page.click_on_create

      assert index_page.shown?
      assert index_page.has_order?(Order.first)

      assert_equal Order.count, 1
      assert_equal Order.first.customer, other_customer
    end

    test 'click on back' do
      Capybara.current_driver = Capybara.javascript_driver

      new_page.visit
      new_page.click_on_back

      assert index_page.shown?
      assert Order.count.zero?
    end

    private

    def index_page
      @index_page ||= Pages::Orders::Index.new(page)
    end

    def new_page
      @new_page ||= Pages::Orders::New.new(page)
    end
  end
end
