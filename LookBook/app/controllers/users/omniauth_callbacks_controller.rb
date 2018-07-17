# Handle OAuth
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    Rails.logger.info("**************** #{auth_hash.to_yaml} ****************")
    @user = User.find_or_create_from_auth(auth_hash)
    session[:user_id] = @user.id
    flash[:success] = "Welcome, #{@user.name}!"
    sign_in_and_redirect @user
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Signed Out'
    redirect_to root_url
  end

  def failure
    flash[:notice] = 'Failed to OAuth with Twitter'
    redirect_to root_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
