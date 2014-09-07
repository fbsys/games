class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :badge_from, :class_name => 'BadgeLog', :foreign_key => 'from_badge_id', :dependent => :delete_all
  has_many :badge_to, :class_name => 'BadgeLog', :foreign_key => 'to_badge_id', :dependent => :delete_all
end
