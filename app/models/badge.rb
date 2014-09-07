class Badge < ActiveRecord::Base
  has_many :badge_logs
  has_many :badge_conditions
  belongs_to :badge_category
end
