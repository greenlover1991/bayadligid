class Payroll < ActiveRecord::Base
	has_many :payroll_details, :dependent=>:destroy
	belongs_to :company
	
	validates_presence_of :date_started, :date_ended
	validate :date_started_cannot_be_greater_than_date_ended
	
	private
	  def date_started_cannot_be_greater_than_date_ended
	  	if !date_ended.nil? and date_started > date_ended
        errors.add(:date_started, "can't be later than date ended")
      end
	  end
  
end
