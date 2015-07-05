# == Schema Information
#
# Table name: loans
#
#  id         :integer         not null, primary key
#  name       :string(255)     not null
#  created_at :datetime
#  updated_at :datetime
#

class Loan < ActiveRecord::Base
  validates_presence_of :name
end
