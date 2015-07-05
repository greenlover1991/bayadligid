module PayrollsHelper
	def get_default_start_date
		tday = Date.today
		tmonth = tday.month
		tyear = tday.year
		d = nil
		if(tday >= 26)
			d = Date.parse("26/#{tmonth}/#{tyear}")
		else
			d = Date.parse("11/#{tmonth}/#{tyear}")
		end
		return d
	end
	
	def get_default_end_date
		return get_default_start_date + 15.days
	end
	

end
