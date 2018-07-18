# Provides a "User" to work with.
module ActiveUser extend ActiveSupport::Concern
  def current_user
    super || guest
  end

  private

  def guest
    # Need GuestUser that behaves like ActiveRecord vs OpenStruct
    # for usage with Petergate
    GuestUser.new(name: 'Guest User',
                  first_name: 'Guest',
                  last_name: 'User',
                  email: 'guest@guest.com')
  end
end
