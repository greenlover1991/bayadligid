module ApplicationHelper
	def pretty_print_date(date)
		return "#{date.month}/#{date.day}/#{date.year}"
	end
	
	def link_to_latest_payroll(company)
		payroll = company.latest_payroll
		if payroll
			if payroll.payroll_type == "Monthly"
				return link_to 'View Latest Payroll', monthly_payroll_company_payroll_path(company.id, payroll.id)
			else
				return link_to 'View Latest Payroll', daily_payroll_company_payroll_path(company.id, payroll.id)			
			end
		else
		  return 'No available payrolls '
		end 
	end
end
