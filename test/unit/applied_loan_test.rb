# == Schema Information
#
# Table name: applied_loans
#
#  id                  :integer         not null, primary key
#  employee_id         :integer         not null
#  loan_id             :integer         not null
#  date_started        :date            not null
#  date_ended          :date            not null
#  amount_per_interval :float           not null
#  original_amount     :float           not null
#  created_at          :datetime
#  updated_at          :datetime
#  interval_type       :string(255)
#

require 'test_helper'

class AppliedLoanTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
