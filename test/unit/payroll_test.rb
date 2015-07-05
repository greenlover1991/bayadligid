# == Schema Information
#
# Table name: payrolls
#
#  id           :integer         not null, primary key
#  date_started :date            not null
#  date_ended   :date            not null
#  created_at   :datetime
#  updated_at   :datetime
#  company_id   :integer
#  payroll_type :string(255)
#

require 'test_helper'

class PayrollTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
