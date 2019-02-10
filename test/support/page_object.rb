class PageObject
  include ApplicationHelper
  include ActionView::Helpers::SanitizeHelper
  include Rails.application.routes.url_helpers

  attr_reader :page

  def initialize(page)
    @page = page
  end
end
