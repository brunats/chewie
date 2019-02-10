class OrdersController < ApplicationController
  before_action :orders, only: :index

  def index
    flash[:success] = 'oie sucess'
  end

  def destroy
    redirect_to(root_path)
  end

  private

  def orders
    @orders ||= Order.all.includes(:customer, :order_products)
  end
end
