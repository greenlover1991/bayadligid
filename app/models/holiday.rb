# == Schema Information
#
# Table name: holidays
#
#  id              :integer         not null, primary key
#  name            :string(255)     not null
#  holiday_type    :string(255)     default("Regular"), not null
#  date_of_holiday :date            not null
#  created_at      :datetime
#  updated_at      :datetime
#

class Holiday < ActiveRecord::Base
	validates_presence_of :name, :holiday_type, :date_of_holiday
	
	def self.holiday_types
		return ["Regular", "Special"]
	end
	
	def self.regular_holidays_of_the_month
		start_of_month = Date.today.beginning_of_month
		end_of_month = Date.today.beginning_of_month
		return Holiday.where(:holiday_type=>"Regular").where(:date_of_holiday=> start_of_month..end_of_month)
	end
	
	def self.special_holidays_of_the_month
		start_of_month = Date.today.beginning_of_month
		end_of_month = Date.today.beginning_of_month
		return Holiday.where(:holiday_type=>"Special").where(:date_of_holiday=> start_of_month..end_of_month)
	end
	
	
	def self.reset_holidays
		# destroy all holidays
		Holiday.destroy_all
		
		# regular holidays
		d = Date.today
		cur_year = d.year
		Holiday.create(:name=>"New Year\'s Day", :holiday_type=>"Regular", :date_of_holiday=>Date.parse("January 1,#{cur_year}"))
		Holiday.create(:name=>"Araw ng Kagitingan", :holiday_type=>"Regular", :date_of_holiday=>Date.parse("April 9,#{cur_year}"))
		Holiday.create(:name=>"Labor Day", :holiday_type=>"Regular", :date_of_holiday=>Date.parse("May 1,#{cur_year}"))
		Holiday.create(:name=>"Independence Day", :holiday_type=>"Regular", :date_of_holiday=>Date.parse("June 12,#{cur_year}"))
		Holiday.create(:name=>"Bonifacio Day", :holiday_type=>"Regular", :date_of_holiday=>Date.parse("November 30,#{cur_year}"))
		Holiday.create(:name=>"Christmas Day", :holiday_type=>"Regular", :date_of_holiday=>Date.parse("December 25,#{cur_year}"))
		Holiday.create(:name=>"Rizal Day", :holiday_type=>"Regular", :date_of_holiday=>Date.parse("December 30,#{cur_year}"))

		# regular special mention
		d = Date.parse("April 1, #{cur_year}")
		first_thurs_of_april = d + (4-d.cwday)
		Holiday.create(:name=>"Maundy Thursday", :holiday_type=>"Regular", :date_of_holiday=>first_thurs_of_april)
		Holiday.create(:name=>"Good Friday", :holiday_type=>"Regular", :date_of_holiday=>(first_thurs_of_april+1))
		# last monday of august
		d = Date.parse("August 31, #{cur_year}")
		last_monday_of_august = d + (1-d.cwday)
		Holiday.create(:name=>"National Heroes Day", :holiday_type=>"Regular", :date_of_holiday=>last_monday_of_august)
	end
	
end
