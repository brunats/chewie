class OrdersController < ApplicationController
  before_action :orders, only: :index
  before_action :order, only: :edit

  def index; end

  def new
    @order = Order.new
  end

  def create
    order = build_order
    return redirect_to(root_path) if order.valid? && order.save
    flash[:warning] = 'faile'
    render :new
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

  def customer
    @customer ||= Customer.find(params[:order][:customer_id])
  end

  def build_order_products
    order_product_list = []
    params[:unit_price].each do |id, unit_price|
      units = params[:units][id]
      next if units.to_i.zero? || unit_price.to_f.zero?
      product = Product.find(id)
      order_product_list << OrderProduct.new(
        product: product,
        unit_price: unit_price,
        units: units
      )
    end
    order_product_list
  end

  def build_order
    Order.new(
      customer: customer,
      order_products: build_order_products
    )
  end
end
