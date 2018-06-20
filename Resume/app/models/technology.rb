# == Schema Information
#
# Table name: technologies
#
#  created_at   :datetime         not null
#  id           :integer          not null, primary key
#  name         :string
#  portfolio_id :integer
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_technologies_on_portfolio_id  (portfolio_id)
#
# Foreign Keys
#
#  fk_rails_...  (portfolio_id => portfolios.id)
#

class Technology < ApplicationRecord
  belongs_to :portfolio, inverse_of: :technologies
  validates :name, presence: true
end
