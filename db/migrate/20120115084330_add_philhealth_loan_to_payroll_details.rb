class AddPhilhealthLoanToPayrollDetails < ActiveRecord::Migration
  def change
  	add_column :payroll_details, :philhealth_loan, :float
  end
end
