# == Schema Information
#
# Table name: bug_reports
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class BugReport < ActiveRecord::Base
  attr_accessible :description
  
  belongs_to :user
  
  validates :description, presence: true,
                          length: { maximum: 250 }
  
end
