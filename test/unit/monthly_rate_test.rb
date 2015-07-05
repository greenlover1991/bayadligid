# == Schema Information
#
# Table name: monthly_rates
#
#  id           :integer         not null, primary key
#  employee_id  :integer         not null
#  rate         :float           not null
#  date_started :date            not null
#  date_ended   :date
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class MonthlyRateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
