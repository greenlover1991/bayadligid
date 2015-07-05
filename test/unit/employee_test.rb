# == Schema Information
#
# Table name: employees
#
#  id               :integer         not null, primary key
#  first_name       :string(255)     not null
#  middle_name      :string(255)     not null
#  last_name        :string(255)     not null
#  address          :text
#  phone_no         :string(255)
#  mobile_no        :string(255)
#  birthdate        :date
#  date_hired       :date
#  date_regularized :date
#  date_left        :date
#  sss_no           :string(255)
#  philhealth_no    :string(255)
#  pagibig_no       :string(255)
#  civil_status     :string(255)
#  status           :string(255)     default("Active"), not null
#  branch_id        :integer         not null
#  created_at       :datetime
#  updated_at       :datetime
#  employee_type    :string(255)
#  rate             :float
#

require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
