class Project < ActiveRecord::Base
  belongs_to :company
  has_many :work
end
