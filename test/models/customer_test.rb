# test/models/user_test.rb
require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  setup do
    @customer = Customer.new(name: 'Chewie')
  end

  test 'invalid without name' do
    @customer.name = ''
    assert @customer.invalid?
    assert_equal @customer.errors[:name], ["can't be blank", 'is too short (minimum is 4 characters)']
  end

  test 'uniqueness name' do
    Customer.create!(name: 'Chewie')
    assert_equal 1, Customer.all.count

    assert @customer.invalid?
    assert_equal @customer.errors[:name], ['has already been taken']
  end

  test 'has many order products' do
    @customer.save!

    orders = [Order.create!(customer: @customer), Order.create!(customer: @customer)]
    assert_equal @customer.orders, orders
  end
end
