class OrderProductController < ApplicationController
  def create
    flash[:warning] = order_error unless order_product.valid? && order_product.save
    redirect_to(edit_order_path(order))
  end

  def destroy
    OrderProduct.find(params[:id]).destroy!
    redirect_to(edit_order_path(order))
  end

  private

  def order_error
    order_product.errors.to_a.first
  end

  def order_product
    @order_product ||= OrderProduct.new(
      order: order,
      product: product,
      units: params[:order_product][:units],
      unit_price: params[:order_product][:unit_price]
    )
  end

  def order
    @order ||= Order.find(params[:order_id])
  end

  def product
    @product ||= Product.find(params[:order_product][:product_id])
  end
end
