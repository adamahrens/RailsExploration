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

  scope :overtime, -> { where('hours > 8') }
  scope :recent, -> { where("date_performed > '#{Time.now - 4.days}'") }

  validates :project, :user, presence: true
  validates :date_performed, presence: true
  validate :date_performed_cant_be_in_future
  validates :hours, numericality: { only_integer: true, greater_than: 0, less_than: 9 }

  def date_performed_cant_be_in_future
    if date_performed.present? && date_performed > Date.today
      errors.add(:date_performed, 'cant be in the future')
    end
  end
end
