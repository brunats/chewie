class MultipleUnitValidator < ActiveModel::Validator
  def validate(order_product)
    return if order_product.product.blank? || multiple_unit(order_product).zero?
    unless (order_product.units % multiple_unit).zero?
      order_product.errors[:base] << I18n.t('.errors.multiple_unit_error', multiple_value: multiple_unit)
    end
  end

  private

  def multiple_unit(order_product = nil)
    @multiple_unit ||= order_product.product.multiple
  end
end
