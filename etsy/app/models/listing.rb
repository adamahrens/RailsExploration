# == Schema Information
#
# Table name: listings
#
#  id                  :integer          not null, primary key
#  name                :string
#  description         :text
#  price               :decimal(, )
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

require 'securerandom'

class Listing < ApplicationRecord

  belongs_to :user

  has_attached_file :avatar, styles: { medium: "400x400>", thumb: "400x400>" }, default_url: "Missing.png",
                    storage: :s3,
                    s3_region: Rails.application.secrets.aws_region,
                    s3_host_name: "s3.amazonaws.com",
                    url: ":s3_host_name",
                    path: "images/:id/:filename",
                    s3_credentials: proc { |a| a.instance.s3_credentials }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates :avatar, attachment_presence: { message: "Attach item image" }

  validates :name, :description, :price, presence: true
  validates :price, numericality: { greater_than: 0 }

  def s3_credentials
    { bucket: Rails.application.secrets.aws_bucket,
      access_key_id: Rails.application.secrets.aws_access_key_id,
      secret_access_key: Rails.application.secrets.aws_secret_access_key }
  end
end
