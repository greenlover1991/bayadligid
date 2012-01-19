module EmployeesHelper
	def pretty_select_for_branches(branches)
	
		cur_company_id = -1
		last_company_name = ""
		i = 0
		result = ""
		result += "<select id='employee_branch_id' name='employee[branch_id]'>"
		
		branches.each do |branch|
			if cur_company_id != branch.company_id
				if i > 0 
					result += "</optgroup>"
				end
				cur_company_id = branch.company_id
				last_company_name = branch.company.name
				result += "<optgroup label='#{last_company_name}'>"
			
				i += 1
			end
			result += "<option value='#{branch.id}'>#{branch.name}</option>"
		end
		result += "</optgroup>"
		result += "</select>"
		return raw(result)
	end
end
