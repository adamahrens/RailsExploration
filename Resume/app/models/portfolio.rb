# == Schema Information
#
# Table name: portfolios
#
#  id         :integer          not null, primary key
#  title      :string
#  subtitle   :string
#  body       :text
#  image      :text
#  thumbnail  :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Portfolio < ApplicationRecord
end
