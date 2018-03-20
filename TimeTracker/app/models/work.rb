# == Schema Information
#
# Table name: works
#
#  id             :integer          not null, primary key
#  date_performed :datetime
#  hours          :decimal(5, 2)
#  project_id     :integer
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Work < ApplicationRecord
  belongs_to :project
  belongs_to :user
end
