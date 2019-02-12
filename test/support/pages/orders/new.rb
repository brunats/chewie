module Pages
  module Orders
    class New < PageObject
      def initialize(page)
        super
      end

      def visit
        @page.visit(new_order_path)
      end

      def shown?
        @page.has_content?('Novo Pedido')
      end

      def select_customer(customer)
        @page.find("option[value='#{customer.id}']").click
      end

      def click_on_create
        @page.find('[name=commit]').click
      end

      def click_on_back
        @page.find('.btn.btn-outline-primary').click
      end
    end
  end
end
