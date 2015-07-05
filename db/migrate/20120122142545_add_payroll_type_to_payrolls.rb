class AddPayrollTypeToPayrolls < ActiveRecord::Migration
  def change
	add_column :payrolls, :payroll_type, :string
  end
end
