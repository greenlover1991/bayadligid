class PayrollDetail < ActiveRecord::Base
  belongs_to :payroll
  belongs_to :employee
  
  @@REGULAR_OT_RATE = 1.25
  @@SPECIAL_OT_RATE = 1.30
  @@LEGAL_OT_RATE = 1.00
  @@DAYOFF_OT_RATE = 1.00
  @@SSS_TAX_RATE = 0.033
  @@PHILHEALTH_TAX_RATE = 0.0125
  @@HDMF_TAX_RATE = 0.02 
  @@WITHHOLDING_TAX_RATE = 0.0453
  
  
  before_save :update_loans_amount
  
  def rate
		from = self.payroll.date_started
		to = self.payroll.date_ended
		r = MonthlyRate.where("(date_started BETWEEN ? AND ? ) OR (date_ended BETWEEN ? AND ?)",from, to, from, to).order('created_at DESC').find_all_by_employee_id(self.employee_id)
		
		if r.empty?
			r = MonthlyRate.find_by_employee_id_and_date_ended(self.employee_id, nil).rate
		else
			r = r[0].rate
		end
		
		@daily_rate = r / 314 * 12
		return @daily_rate
  end
  
  def half_monthly_rate
  	rate * 314 / 24 
  end
  
  def basic_pay
  	r = 0 
  	if(@daily_rate.nil?)
  		r = rate
  	else
  		r = @daily_rate
  	end
	  return r * days_worked
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
  
  def sss_contribution
  	gross_pay * @@SSS_TAX_RATE
  end
  
  def philhealth_contribution
  	gross_pay * @@PHILHEALTH_TAX_RATE
  end
  
  def hdmf_contribution
  	gross_pay * @@HDMF_TAX_RATE
  end
  
  def with_tax
  	gross_pay * @@WITHHOLDING_TAX_RATE
  end
  
  def total_deduction
  	sss_contribution + philhealth_contribution + hdmf_contribution + sss_loan + hdmf_loan + philhealth_loan + salary_loan + calamity_loan + with_tax + other_deduction
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
  	

  
end


