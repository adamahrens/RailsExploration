# Sets the query param into Session
module SetSource
  extend ActiveSupport::Concern

  included do
    before_action :set_source
  end

  private

  def set_source
    session[:source] = params[:query] if params[:query]
  end
end
