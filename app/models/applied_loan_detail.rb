class AppliedLoanDetail < ActiveRecord::Base
  belongs_to :applied_loan
  has_one :loan, :through=> :applied_loan
  has_one :employee, :through=>:applied_loan
end
