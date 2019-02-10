ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'

require 'rails/test_help'
require 'selenium/webdriver'
require 'capybara/rails'
require 'support/page_object'

require Rails.root.join('test', 'support', 'capybara_extras.rb').to_s
Dir[Rails.root.join('test', 'support', '**', '*.rb')].each { |f| require f }

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.register_driver :headless_chrome do |app|
  browser_args = %w[no-sandbox headless disable-gpu window-size=1200x600 --start-maximized]
  browser_args.delete('headless') if ENV['BROWSER'].present?
  options = { args: browser_args }
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(chromeOptions: options)
  Capybara::Selenium::Driver.new(app,browser: :chrome, desired_capabilities: capabilities)
end

Capybara.javascript_driver = :headless_chrome

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

DatabaseCleaner.strategy = :transaction
