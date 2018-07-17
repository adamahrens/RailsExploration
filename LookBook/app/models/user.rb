# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  provider               :string
#  uid                    :string
#  oauth_token            :string
#  oauth_expires_at       :datetime
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :omniauthable,
         omniauth_providers: %i[twitter]

  def self.find_or_create_from_auth(auth)
    find_auth(auth) || create_auth(auth)
  end

  def self.find_auth(auth)
    where(provider: auth.provider, uid: auth.uid).first
  end

  def self.create_auth(auth)
    create(provider: auth.provider,
           uid: auth.uid,
           name: auth.info.name,
           oauth_token: auth.credentials.token)
  end

  def password_required?
    (provider.blank? || uid.blank?) && super
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end
end
