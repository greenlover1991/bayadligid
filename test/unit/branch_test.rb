# == Schema Information
#
# Table name: branches
#
#  id         :integer         not null, primary key
#  name       :string(255)     not null
#  company_id :integer         not null
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class BranchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
