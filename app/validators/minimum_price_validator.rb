class MinimumPriceValidator < ActiveModel::Validator
  def validate(order_product)
    @order_product = order_product
    return if @order_product.product.blank?
    if @order_product.unit_price.to_f < minimun_value
      @order_product.errors[:base] << I18n.t('.errors.difference_price_error', minimun_value: minimun_value)
    end
  end

  private

  def minimun_value
    @order_product.product.price.to_f * 0.9
  end
end
