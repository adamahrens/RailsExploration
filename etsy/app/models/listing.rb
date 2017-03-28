class Listing < ApplicationRecord
  has_attached_file :avatar, styles: { medium: "200x200>", thumb: "100x100>" }, default_url: "Missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
