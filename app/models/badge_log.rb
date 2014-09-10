class BadgeLog < ActiveRecord::Base
  belongs_to :badge
  belongs_to :from_user, :class_name => 'User', :foreign_key => 'from_user_id'
  belongs_to :to_user, :class_name => 'User', :foreign_key => 'to_user_id'
  
  validates :badge_id, presence: true
  validates :to_user_id, presence: true
end
