class Employee < ActiveRecord::Base
  belongs_to :branch
  has_one :company, :through=>:branch
  has_many :payroll_details, :dependent=>:destroy
  has_many :applied_loans, :dependent=>:destroy
  
  
  validates_presence_of :first_name, :middle_name, :last_name, :status, :branch
  #validates_uniqueness_of :sss_no, :philhealth_no, :pagibig_no
  
  attr_accessor :monthly_salary
  
  after_create :create_monthly_rate
  after_update :update_monthly_rate
  
  def daily_rate
	  monthly_rate / 314 * 12
  end
  
  def monthly_rate
		r = MonthlyRate.find_by_employee_id_and_date_ended(self.id, nil)
		return r.nil? ? 0 : r.rate
  end
  
  def complete_name
  	self.last_name + ", " + self.first_name
  end
  
  def self.statuses
  	return ["Active", "Fired", "Resigned"]
  end
  
  def self.civil_statuses
  	return ["Single", "Married", "Widowed"]
  end
  
	def self.company_employees(company_id)
		return Employee.joins(:branch, :company).where("companies.id = #{company_id}")
	end
	
	private 
		def create_monthly_rate
			MonthlyRate.create(:employee_id=>self.id, :rate=>self.monthly_salary, :date_started=>Date.today.beginning_of_month)
		end
		
		def update_monthly_rate
			mRate = MonthlyRate.find_by_employee_id_and_date_ended(self.id, nil)
			if(!mRate.nil? && mRate.rate != self.monthly_salary)
				MonthlyRate.update(mRate,:date_ended=>Date.today.end_of_month)
			end
			MonthlyRate.create(:employee_id=>self.id, :rate=>self.monthly_salary, :date_started=>Date.today.end_of_month+1.days)

		end
		
end
