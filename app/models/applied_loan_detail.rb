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

class AppliedLoanDetail < ActiveRecord::Base
  belongs_to :applied_loan
  has_one :loan, :through=> :applied_loan
  has_one :employee, :through=>:applied_loan
end
