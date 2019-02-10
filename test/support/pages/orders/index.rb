module Pages
  module Orders
    class Index < PageObject
      def initialize(page)
        super
      end

      def visit
        @page.visit(root_path)
      end

      def has_navbar?
        @page.find('.navbar').visible?
      end

      def navbar_title
        @page.find('.navbar a').text
      end
    end
  end
end
