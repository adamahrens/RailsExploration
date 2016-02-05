class Work < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  validates_presence_of :project, message: 'Work must belong to a Project'
  validates_presence_of :user, message: 'Work must belong to a User'
  validates_numericality_of :hours, greater_than: 0, less_than_or_equal_to: 8, message: 'Work must be 1-8 hours'
  validate :date_not_in_future

  def date_not_in_future
  	date_performed < Time.now
  end

  # self. means it's a class method. So Work.recent_days
  def self.recent_days(number_of_days_ago)
  	since_date = Time.now - number_of_days_ago.to_i.days
  	where("date_performed > :since_date", since_date: since_date)
  end
end
