# == Schema Information
#
# Table name: works
#
#  id             :integer          not null, primary key
#  project_id     :integer
#  user_id        :integer
#  date_performed :date
#  hours          :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Work < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  validates :project, presence: { message: 'Work must belong to a Project' }
  validates :user, presence: { message: 'Work must belong to a User' }
  valdiates :hours, numericality: { greater_than: 0, less_than_or_equal_to: 8, message: 'Work must be 1-8 hours' }
  validate :date_not_in_future

  # validation method
  def date_not_in_future
  	date_performed < Time.now
  end

  # self. means it's a class method. So Work.recent_days
  def self.recent_days(number_of_days_ago)
  	since_date = Time.now - number_of_days_ago.to_i.days
  	where("date_performed > :since_date", since_date: since_date)
  end

  def to_s
    "#{user} is on #{project}"
  end
end
