# Set default page content
module DefaultPageContent extend ActiveSupport::Concern
  included do
    before_action :set_page_defaults
  end

  private

  def set_page_defaults
    @page_title = 'Appsbyahrens'
  end
end
