require 'test_helper'

module Orders
  class IndexTest < ActionDispatch::IntegrationTest
    include Capybara::DSL

    test 'index page must have navbar' do
      Capybara.current_driver = Capybara.javascript_driver
      index_page.visit
      assert index_page.has_navbar?
    end

    test 'navbar has Chewie Store' do
      Capybara.current_driver = Capybara.javascript_driver
      index_page.visit
      assert_equal index_page.navbar_title, 'Chewie Store'
    end

    private

    def index_page
      @index_page ||= Pages::Orders::Index.new(page)
    end
  end
end
