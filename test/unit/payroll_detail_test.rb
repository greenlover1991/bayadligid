# == Schema Information
#
# Table name: payroll_details
#
#  id                      :integer         not null, primary key
#  payroll_id              :integer
#  employee_id             :integer
#  days_worked             :float
#  hours_regular_overtime  :float
#  hours_special_overtime  :float
#  hours_legal_overtime    :float
#  hours_day_off_overtime  :float
#  days_legal_holiday      :integer
#  days_absent             :float
#  minutes_tardy           :float
#  adjustment              :float
#  other_deduction         :float
#  created_at              :datetime
#  updated_at              :datetime
#  sss_loan                :float
#  hdmf_loan               :float
#  salary_loan             :float
#  calamity_loan           :float
#  philhealth_loan         :float
#  sss_contribution        :float
#  philhealth_contribution :float
#  hdmf_contribution       :float
#  with_tax                :float
#  losses                  :float
#  cash_advance            :float
#

require 'test_helper'

class PayrollDetailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
