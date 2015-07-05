# == Schema Information
#
# Table name: applied_loan_details
#
#  id              :integer         not null, primary key
#  applied_loan_id :integer
#  amount          :float
#  date_applied    :date
#  created_at      :datetime
#  updated_at      :datetime
#

require 'test_helper'

class AppliedLoanDetailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
