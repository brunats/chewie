class OrdersController < ApplicationController
  before_action :orders, only: :index
  before_action :order, only: :edit

  def index; end

  def new
    @new_order = Order.new
  end

  def create
    return redirect_to(root_path) if new_order.valid? && new_order.save
    flash[:warning] = new_roder.errors.to_a.first

    render :new
  end

  def edit; end

  def update
    order.customer = customer
    return redirect_to(root_path) if order.valid? && order.save
    flash[:warning] = order.errors.to_a.first

    render :edit
  end

  def destroy
    flash[:success] = I18n.t('.destroyed') if order.destroy
    redirect_to(root_path)
  end

  private

  def order
    @order ||= Order.find(params[:id])
  end

  def new_order
    @new_order ||= Order.new(customer: customer)
  end

  def orders
    @orders ||= Order.all.includes(:customer, :order_products)
  end

  def customer
    @customer ||= Customer.find(params[:order][:customer_id])
  end
end
