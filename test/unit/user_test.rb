# == Schema Information
#
# Table name: users
#
#  id          :integer         not null, primary key
#  login       :string(255)     not null
#  password    :string(255)     not null
#  employee_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
