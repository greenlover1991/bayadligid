# == Schema Information
#
# Table name: payroll_details
#
#  id                      :integer         not null, primary key
#  payroll_id              :integer
#  employee_id             :integer
#  days_worked             :float
#  hours_regular_overtime  :float
#  hours_special_overtime  :float
#  hours_legal_overtime    :float
#  hours_day_off_overtime  :float
#  days_legal_holiday      :integer
#  days_absent             :float
#  minutes_tardy           :float
#  adjustment              :float
#  other_deduction         :float
#  created_at              :datetime
#  updated_at              :datetime
#  sss_loan                :float
#  hdmf_loan               :float
#  salary_loan             :float
#  calamity_loan           :float
#  philhealth_loan         :float
#  sss_contribution        :float
#  philhealth_contribution :float
#  hdmf_contribution       :float
#  with_tax                :float
#  losses                  :float
#  cash_advance            :float
#

class PayrollDetail < ActiveRecord::Base
  belongs_to :payroll
  belongs_to :employee
  
  @@REGULAR_OT_RATE = 1.25
  @@SPECIAL_OT_RATE = 0.30
  @@LEGAL_OT_RATE = 1.00
  @@DAYOFF_OT_RATE = 1.00
  
  before_save :update_loans_amount
 
  def rate
  	@rate = 0.0
  	if self.payroll.payroll_type == "Monthly"
  		@rate = self.employee.rate / 314 * 12
  	else
  	  @rate = self.employee.rate
  	end
		return self.employee.rate
  end
  
  def half_monthly_rate
  	rate / 2
  end
  
  def basic_pay
  	if @rate.nil?
  		rate
  	end
  	
		if self.payroll.payroll_type == "Monthly"
			self.employee.rate / 2
		else
		  self.employee.rate * days_worked
		end
  end
  
  def total_overtime_hours
  	hours_regular_overtime + hours_special_overtime + hours_legal_overtime
  end
  
  def regular_ot_amount
  	hours_regular_overtime / 8 * @rate * @@REGULAR_OT_RATE
  end
  
  def special_ot_amount
  	#hours_special_overtime / 8 * @rate * @@SPECIAL_OT_RATE
  	hours_special_overtime / 8 * self.employee.rate / 26 * @@SPECIAL_OT_RATE
  end
  
  def legal_ot_amount
  	#hours_legal_overtime / 8 * @rate * @@LEGAL_OT_RATE
  	hours_legal_overtime / 8 * self.employee.rate / 26 * @@LEGAL_OT_RATE
  end
  
  def work_on_day_off_amount
  	#hours_day_off_overtime / 8 * @rate * @@DAYOFF_OT_RATE
  	hours_legal_overtime / 8 * self.employee.rate / 26 * @@DAYOFF_OT_RATE
  end
  
  
  def total_overtime_amount
  	regular_ot_amount + special_ot_amount + legal_ot_amount
  end
 
  def legal_holiday_amount
	 	days_legal_holiday * @rate
  end
  
  def absent_amount
  	days_absent * @rate
  end
  
  def tardy_amount
    if(self.payroll.payroll_type == "Monthly")
      return minutes_tardy * 2.0;
    else
      return @rate/480.0 * minutes_tardy
    end
  	#(1.0 - ((480.0 - minutes_tardy) / 480) ) * @rate
  end
  
  def gross_pay
  	basic_pay + total_overtime_amount + work_on_day_off_amount + legal_holiday_amount + adjustment - absent_amount - tardy_amount
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
    	self.cash_advance = loans["Cash Advance"].nil? ? 0 : loans["Cash Advance"]
    	self.losses = loans["Losses"].nil? ? 0 : loans["Losses"]
    	self.other_deduction = loans["Other Deductions"].nil? ? 0 : loans["Other Deductions"]
    end
  	

  
end


