class OrdersController < ApplicationController
  before_action :orders, only: :index

  def index; end

  private

  def orders
    @orders ||= Order.all.includes(:customer, :order_products)
  end
end
