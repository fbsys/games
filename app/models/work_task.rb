class WorkTask < ActiveRecord::Base
  validates :short_task_code, :uniqueness => true
  
  has_many :time_management_sheets
end
