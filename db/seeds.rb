# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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

# special holidays
Holiday.create(:name=>"Chinese New Year", :holiday_type=>"Special", :date_of_holiday=>Date.parse("January 23,#{cur_year}"))
Holiday.create(:name=>"Ninoy Aquino Day", :holiday_type=>"Special", :date_of_holiday=>Date.parse("August 21,#{cur_year}"))
Holiday.create(:name=>"All Saints\' Day", :holiday_type=>"Special", :date_of_holiday=>Date.parse("November 1,#{cur_year}"))
Holiday.create(:name=>"Additional special non-working day", :holiday_type=>"Special", :date_of_holiday=>Date.parse("November 2,#{cur_year}"))
Holiday.create(:name=>"New Year\'s Eve", :holiday_type=>"Special", :date_of_holiday=>Date.parse("December 31,#{cur_year}"))

# companies
companies = Company.create([{:name=>"Bibo Family Entertainment Inc."}, {:name=>"iTech Trading"}])

# branches
Branch.create(:company => companies.first, :name=>"SM Cebu Bibo")
Branch.create(:company => companies[1], :name=>"Ayala")
Branch.create(:company => companies[1], :name=>"SM Cebu")
Branch.create(:company => companies[1], :name=>"SM CDO")
Branch.create(:company => companies[1], :name=>"SM Calamba")
Branch.create(:company => companies[1], :name=>"SM North Edsa")
Branch.create(:company => companies[1], :name=>"Glorietta")
Branch.create(:company => companies[1], :name=>"Market Market")
Branch.create(:company => companies[1], :name=>"Greenhills")

# loans
Loan.create(:name=>"HDMF")
Loan.create(:name=>"SSS")
Loan.create(:name=>"PhilHealth")
Loan.create(:name=>"Salary")
Loan.create(:name=>"Calamity")

# users
u = User.create(:login=>'greenlover1991', :password=>'steven')
s = User.create(:login=>'shirley', :password=>'shirley')
u.companies = companies
s.companies = companies

