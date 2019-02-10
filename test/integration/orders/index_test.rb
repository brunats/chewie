require 'test_helper'

module Orders
  class IndexTest < ActionDispatch::IntegrationTest
    include Capybara::DSL

    test 'test' do
      Capybara.current_driver = Capybara.javascript_driver

      index_page.visit
      # binding.pry
    end

    private

    def index_page
      @index_page ||= Pages::Orders::Index.new(page)
    end
  end
end
