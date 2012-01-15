class AddLoansToPayrollDetails < ActiveRecord::Migration
  def change
  	add_column :payroll_details, :sss_loan, :float
  	add_column :payroll_details, :hdmf_loan, :float
  end
end
