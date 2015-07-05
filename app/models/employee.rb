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

class Employee < ActiveRecord::Base
  belongs_to :branch
  has_one :company, :through=>:branch
  has_many :payroll_details, :dependent=>:destroy
  has_many :applied_loans, :dependent=>:destroy
  has_many :users, :through=>:company
  
  validates_presence_of :first_name, :middle_name, :last_name, :status, :branch
  validates_numericality_of :rate, :greater_than => 0
  #validates_uniqueness_of :sss_no, :philhealth_no, :pagibig_no
  
  
	
	
  before_save :set_date_regularized
  
  @@loan_names = nil
  @balance = nil
  
  def complete_name
  	self.last_name + ", " + self.first_name
  end
  
  def full_name
  	complete_name + ' ' + self.middle_name
  end
  
  def self.employee_types
		return ["Monthly", "Daily"]
  end
  
  def self.statuses
  	return ["Active", "Fired", "Resigned"]
  end
  
  def self.civil_statuses
  	return ["Single", "Married", "Widowed"]
  end
  
	def self.company_employees(company_id, payroll_type)
		return Employee.joins(:branch, :company).where("companies.id = ? AND employees.employee_type = ?",company_id,payroll_type).order("branches.name").order(:last_name)
	end
	
	def remaining_balance(loan_name)
		load_loan_names if @@loan_names.nil?
		load_loan_balances if @balances.nil?
		return "%.2f" % @balances[loan_name]
	end
	
	private 
		# def create_monthly_rate
			# MonthlyRate.create(:employee_id=>self.id, :rate=>self.monthly_salary, :date_started=>Date.today.beginning_of_month)
		# end
		
		# def update_monthly_rate
			# mRate = MonthlyRate.find_by_employee_id_and_date_ended(self.id, nil)
			# if(!mRate.nil? && mRate.rate != self.monthly_salary)
				# MonthlyRate.update(mRate,:date_ended=>Date.today.end_of_month)
			# end
			# MonthlyRate.create(:employee_id=>self.id, :rate=>self.monthly_salary, :date_started=>Date.today.end_of_month+1.days)

		# end
		
		def set_date_regularized
			self.date_regularized = self.date_hired + 6.months
		end
		
		def load_loan_names
			@@loan_names = {}
			loans = Loan.select([:id, :name])
			loans.each { |l| @@loan_names[l.id] = l.name }
		end
		
		def load_loan_balances
		  @balances = {}
			
			@@loan_names.each { |key, value| @balances[value] = 0.0 }
			
			als = self.applied_loans.where("#{:date_ended} > '#{Date.today}'")
			
			als.each do |al|
				@balances[@@loan_names[al.loan_id]] += al.remaining_balance
			end
		end
end
