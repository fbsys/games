class Badge < ActiveRecord::Base
  has_many :badge_logs
  has_many :badge_conditions
  belongs_to :badge_category
  belongs_to :file, :class_name => 'UploadFile', :foreign_key => 'upload_file_id', :dependent => :destroy
  
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :badge_category_id, presence: true
  validates :upload_file_id, presence: true
  validates :description, presence: true
  
end
