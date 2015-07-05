module AppliedLoansHelper
	def employee_full_name(emp_id)
		Employee.find(emp_id).complete_name
	end
end
