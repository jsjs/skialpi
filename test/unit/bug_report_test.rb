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

require 'test_helper'

class BugReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
