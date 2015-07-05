# == Schema Information
#
# Table name: companies
#
#  id         :integer         not null, primary key
#  name       :string(255)     not null
#  created_at :datetime
#  updated_at :datetime
#

class Company < ActiveRecord::Base
	has_many :branches, :dependent=>:destroy
	has_many :payrolls, :dependent=>:destroy
	
	has_and_belongs_to_many :users
	
	validates_presence_of :name
	validates_uniqueness_of :name
	

	def employees
	  branch_ids = []
	  self.branches.each do |b|
	  	branch_ids << b.id
	  end
	  return Employee.where(:branch_id=>branch_ids).order([:branch_id,:last_name])
	end
	
	def employee_count
		employees.count
	end
	
	def latest_payroll
		Payroll.where(:company_id=>self.id).order(:date_started).last
  end
	
end
