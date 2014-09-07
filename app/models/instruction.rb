class Instruction < ActiveRecord::Base
  validates :instruction_code, :uniqueness => true
  
  has_many :time_management_sheets
  
  before_validation :code_padding
  
  def code_padding
    self.instruction_code = format("%07d", self.instruction_code.to_i)
  end
end
