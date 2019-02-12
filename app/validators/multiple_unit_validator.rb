class MultipleUnitValidator < ActiveModel::Validator
  def validate(order_product)
    @order_product = order_product
    return if @order_product.product.blank? || multiple_unit.zero?
    unless (@order_product.units.to_i % multiple_unit).zero?
      @order_product.errors[:base] << I18n.t('.errors.multiple_unit_error', multiple_value: multiple_unit)
    end
  end

  private

  def multiple_unit
    @order_product.product.multiple.to_i
  end
end
