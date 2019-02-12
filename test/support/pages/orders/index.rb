module Pages
  module Orders
    class Index < PageObject
      def initialize(page)
        super
      end

      def visit
        @page.visit(root_path)
      end

      def shown?
        @page.has_content?('Pedido')
      end

      def has_navbar?
        @page.find('.navbar').visible?
      end

      def has_order?(order)
        @page.find("#order#{order.id}").visible?
      end

      def has_alert?
        @page.find('.alert').visible?
      end

      def click_on_delete_order(order)
        @page.find("#order#{order.id} .btn-outline-danger").click
      end

      def navbar_title
        @page.find('.navbar a').text
      end

      def alert_text
        @page.find('.alert').text
      end
    end
  end
end
