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
end
