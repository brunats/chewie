class OrdersController < ApplicationController
  before_action :orders, only: :index
  before_action :order, only: :edit

  def index; end

  def new
    @order = Order.new
  end

  def create
    raise
  end

  def edit; end

  def update; end

  def destroy
    flash[:success] = I18n.t('.destroyed') if order.destroy
    redirect_to(root_path)
  end

  private

  def order
    @order ||= Order.find(params[:id])
  end

  def orders
    @orders ||= Order.all.includes(:customer, :order_products)
  end
end
