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

class MonthlyRate < ActiveRecord::Base
  belongs_to :employee
  
  validates_presence_of :date_started, :rate
  
end
