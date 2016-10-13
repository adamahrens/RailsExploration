class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Forces the User to be signed in before performing any actions
  before_action :authenticate_user!

  private
    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(root_path)
    end
end
