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
b1 = Branch.create(:company => companies.first, :name=>"SM Cebu")
b2 = Branch.create(:company => companies.first, :name=>"SM Ilo-Ilo II")
Branch.create(:company => companies[1], :name=>"Ayala")
b3 = Branch.create(:company => companies[1], :name=>"SM Cebu")
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

# daily employees
# bibo cebu
Employee.create(:first_name =>"Jeffrey", :last_name=>"Alburo", :middle_name=>"M", :birthdate=>Date.parse("January 19, 1980"), :rate=>305, :branch_id=>b1.id, :date_hired=>Date.today, :employee_type=>"Daily")
Employee.create(:first_name =>"Rodrigo", :last_name=>"Cortes", :middle_name=>"Y", :birthdate=>Date.parse("January 19, 1980"), :rate=>360, :branch_id=>b1.id, :date_hired=>Date.today, :employee_type=>"Daily")
Employee.create(:first_name =>"Steven", :last_name=>"Lalican", :middle_name=>"B", :birthdate=>Date.parse("January 19, 1980"), :rate=>305, :branch_id=>b1.id, :date_hired=>Date.today, :employee_type=>"Daily")
# bibo lilo-an
Employee.create(:first_name =>"Josel", :last_name=>"Bermejo", :middle_name=>"B", :birthdate=>Date.parse("January 19, 1980"), :rate=>275, :branch_id=>b2.id, :date_hired=>Date.today, :employee_type=>"Daily")
Employee.create(:first_name =>"Erwin", :last_name=>"Cencia", :middle_name=>"S", :birthdate=>Date.parse("January 19, 1980"), :rate=>265, :branch_id=>b2.id, :date_hired=>Date.today, :employee_type=>"Daily")
Employee.create(:first_name =>"Jose Jolito", :last_name=>"Saludo", :middle_name=>"R", :birthdate=>Date.parse("January 19, 1980"), :rate=>277, :branch_id=>b2.id, :date_hired=>Date.today, :employee_type=>"Daily")
Employee.create(:first_name =>"Michael", :last_name=>"Santillana", :middle_name=>"R", :birthdate=>Date.parse("January 19, 1980"), :rate=>265, :branch_id=>b2.id, :date_hired=>Date.today, :employee_type=>"Daily")
Employee.create(:first_name =>"Richel", :last_name=>"Zaragoza", :middle_name=>"G", :birthdate=>Date.parse("January 19, 1980"), :rate=>306, :branch_id=>b2.id, :date_hired=>Date.today, :employee_type=>"Daily")
# itech sm cebu
Employee.create(:first_name =>"Jovelyn", :last_name=>"Juele", :middle_name=>"Y", :birthdate=>Date.parse("January 19, 1980"), :rate=>16500, :branch_id=>b3.id, :date_hired=>Date.today, :employee_type=>"Monthly")
Employee.create(:first_name =>"Jessie", :last_name=>"Navarro", :middle_name=>"H", :birthdate=>Date.parse("January 19, 1980"), :rate=>28000, :branch_id=>b3.id, :date_hired=>Date.today, :employee_type=>"Monthly")
Employee.create(:first_name =>"Emilio Jr.", :last_name=>"Valiente", :middle_name=>"D", :birthdate=>Date.parse("January 19, 1980"), :rate=>13500, :branch_id=>b3.id, :date_hired=>Date.today, :employee_type=>"Monthly")
