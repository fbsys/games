class WorkProcess < ActiveRecord::Base
  validates :process_code, :uniqueness => true
  
  has_many :time_management_sheets
  
  before_validation :code_padding
  
  def code_padding
    self.process_code = format("%03d", self.process_code.to_i)
  end
end
