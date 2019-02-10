require 'test_helper'

class OrderControllerTest < ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers
  test 'index response success' do
    get root_path
    assert_response :success
  end
end
