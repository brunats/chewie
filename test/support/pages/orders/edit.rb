module Pages
  module Orders
    class Edit < PageObject
      def initialize(page)
        super
      end

      def visit(order)
        @page.visit(edit_order_path({id: order.id}))
      end

      def shown?(order)
        @page.has_content?("Pedido ##{order.id}")
      end

      def select_product(product)
        @page.find("option[value='#{product.id}']").click
      end

      def fill_in_product_price(price)
        @page.find('#order_product_unit_price').fill_in with: price
      end

      def fill_in_product_unit(units)
        @page.find('#order_product_units').fill_in with: units
      end

      def click_on_add
        @page.find('.new_order_product [name=commit]').click
      end

      def click_on_delete(order_product)
        @page.find(:xpath, "//*[@id=\"order#{order_product.id}\"]/td[5]/a[1]").click
      end

      def click_on_back
        @page.find('.btn.btn-outline-primary').click
      end
    end
  end
end
