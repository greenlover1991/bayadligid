class AddEmployeeTypeToEmployees < ActiveRecord::Migration
  def change
	add_column :employees, :employee_type, :string
	add_column :employees, :rate, :float
  end
end
