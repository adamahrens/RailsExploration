class Listing < ApplicationRecord
  has_attached_file :avatar, styles: { medium: "400x400>", thumb: "400x400>" }, default_url: "Missing.png",
                    storage: :s3,
                    s3_region: Rails.application.secrets.aws_region,
                    s3_host_name: "s3.amazonaws.com",
                    url: ":s3_host_name",
                    path: "blah/#{Time.now.to_s}",
                    s3_credentials: proc { |a| a.instance.s3_credentials }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def s3_credentials
    { bucket: Rails.application.secrets.aws_bucket,
      access_key_id: Rails.application.secrets.aws_access_key_id,
      secret_access_key: Rails.application.secrets.aws_secret_access_key }
  end
end
