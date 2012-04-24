# == Schema Information
#
# Table name: holidays
#
#  id              :integer         not null, primary key
#  name            :string(255)     not null
#  holiday_type    :string(255)     default("Regular"), not null
#  date_of_holiday :date            not null
#  created_at      :datetime
#  updated_at      :datetime
#

require 'test_helper'

class HolidayTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
