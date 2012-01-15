class MonthlyRate < ActiveRecord::Base
  belongs_to :employee
  
  validates_presence_of :date_started, :rate
  
end
