class PayrollDetail < ActiveRecord::Base
  belongs_to :payroll
  belongs_to :employee
  
  @@REGULAR_OT_RATE = 1.25
  @@SPECIAL_OT_RATE = 1.30
  @@LEGAL_OT_RATE = 1.00
  @@DAYOFF_OT_RATE = 1.00
  
  before_save :update_loans_amount
  before_save :update_hours_legal_overtime
  def rate
		@daily_rate = self.employee.rate / 314 * 12
		return self.employee.rate
  end
  
  def half_monthly_rate
  	rate / 2
  end
  
  def basic_pay
  	return rate * days_worked
  end
  
  def total_overtime_hours
  	hours_regular_overtime + hours_special_overtime + hours_legal_overtime
  end
  
  def regular_ot_amount
  	hours_regular_overtime / 8 * @daily_rate * @@REGULAR_OT_RATE
  end
  
  def special_ot_amount
  	hours_special_overtime / 8 * @daily_rate * @@SPECIAL_OT_RATE
  end
  
  def legal_ot_amount
  	hours_legal_overtime / 8 * @daily_rate * @@LEGAL_OT_RATE
  end
  
  def work_on_day_off_amount
  	hours_day_off_overtime / 8 * @daily_rate * @@DAYOFF_OT_RATE
  end
  
  
  def total_overtime_amount
  	regular_ot_amount + special_ot_amount + legal_ot_amount
  end
 
  def legal_holiday_amount
	 	days_legal_holiday * @daily_rate
  end
  
  def absent_amount
  	days_absent * @daily_rate
  end
  
  def tardy_amount
  	(1.0 - ((480.0 - minutes_tardy) / 480) ) * @daily_rate
  end
  
  def gross_pay
  	basic_pay + total_overtime_amount + work_on_day_off_amount + adjustment - absent_amount - tardy_amount
  end
  
  def total_deduction
  	sss_contribution + philhealth_contribution + hdmf_contribution + sss_loan + hdmf_loan + philhealth_loan + salary_loan + calamity_loan + with_tax + other_deduction + losses + cash_advance
  end
  
  def net_pay
  	gross_pay - total_deduction
  end
  
  private
    def update_loans_amount
    	loans = AppliedLoanDetail.joins(:employee, :loan).where(:date_applied=>self.payroll.date_started..self.payroll.date_ended).where("employees.id = #{self.employee_id}").group('name').sum(:amount) 
    	self.sss_loan = loans["SSS"].nil? ? 0 : loans["SSS"]
    	self.hdmf_loan = loans["HDMF"].nil? ? 0 : loans["HDMF"]
    	self.philhealth_loan = loans["PhilHealth"].nil? ? 0 : loans["PhilHealth"]
    	self.salary_loan = loans["Salary"].nil? ? 0 : loans["Salary"]
    	self.calamity_loan = loans["Calamity"].nil? ? 0 : loans["Calamity"]
    end
	
	def update_hours_legal_overtime
		self.hours_legal_overtime = self.days_legal_holiday * 8.0
	end
  	

  
end


