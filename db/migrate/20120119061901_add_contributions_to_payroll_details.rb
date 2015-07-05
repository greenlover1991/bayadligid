class AddContributionsToPayrollDetails < ActiveRecord::Migration
  def change
	add_column :payroll_details, :sss_contribution, :float
	add_column :payroll_details, :philhealth_contribution, :float
	add_column :payroll_details, :hdmf_contribution, :float
	add_column :payroll_details, :with_tax, :float
	add_column :payroll_details, :losses, :float
	add_column :payroll_details, :cash_advance, :float
  end
end
