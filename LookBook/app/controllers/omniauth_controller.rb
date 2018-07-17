# Handle OAuth
class Users::OmniauthController < DeviseController
  def twitter
    @user = User.find_or_create_from_auth(auth_hash)
    if @user.persisted?
      sign_in_and_redirect @user
    else
      session['devise.user_attributes'] = @user.attributes
      redirect_to new_user_registration_path, notice: 'Something blew up'
    end
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
