class AddSalaryLoansToPayrollDetails < ActiveRecord::Migration
  def change
	  add_column :payroll_details, :salary_loan, :float
  	add_column :payroll_details, :calamity_loan, :float
  end
end
