module Pages
  module Orders
    class Index < PageObject
      def initialize(page)
        super
      end

      def visit
        @page.visit(root_path)
      end
    end
  end
end
