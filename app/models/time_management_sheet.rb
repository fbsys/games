class TimeManagementSheet < ActiveRecord::Base
  validates :year, presence: true
  validates :month, presence: true
  validates :employee_num, presence: true
  validates :company_name, presence: true
  validates :department_code, presence: true
  validates :instruction_id, presence: true
  validates :team_code, presence: true
  validates :work_task_id, presence: true
  validates :work_process_id, presence: true
  validates :man_hour, presence: true
  validates :task_code, presence: true
  
  validates_format_of :year, with: /\A[0-9][0-9][0-9][0-9]\Z/, allow_nil: false
  validates_format_of :month, with: /\A[0-9]?[0-9]\Z/, allow_nil: false
  
  belongs_to :avatar
  
  belongs_to :instruction
  #accepts_nested_attributes_for :instructions
  #attr_accessible :instructions_attributes
  
  belongs_to :work_task
  #accepts_nested_attributes_for :work_tasks
  #attr_accessible :work_tasks_attributes
  
  belongs_to :work_process
  #accepts_nested_attributes_for :work_processes
  #attr_accessible :work_processes_attributes
  

end
