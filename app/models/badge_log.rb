class BadgeLog < ActiveRecord::Base
  belongs_to :badge
  belongs_to :from_user, :class_name => 'User', :foreign_key => 'from_badge_id'
  belongs_to :to_user, :class_name => 'User', :foreign_key => 'to_badge_id'
end
