# == Schema Information
#
# Table name: roles
#
#  id         :integer         not null, primary key
#  name       :string(255)     not null
#  created_at :datetime
#  updated_at :datetime
#

class Role < ActiveRecord::Base
	validates_presence_of :name
  validates_uniqueness_of :name
end
