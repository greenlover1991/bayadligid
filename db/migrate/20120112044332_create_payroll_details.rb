class CreatePayrollDetails < ActiveRecord::Migration
  def change
    create_table :payroll_details do |t|
      t.references :payroll
      t.references :employee
      t.float :days_worked
      t.float :hours_regular_overtime
      t.float :hours_special_overtime
      t.float :hours_legal_overtime
      t.float :hours_day_off_overtime
      t.integer :days_legal_holiday
      t.float :days_absent
      t.float :minutes_tardy
      t.float :adjustment
      t.float :other_deduction

      t.timestamps
    end
    add_index :payroll_details, :payroll_id
    add_index :payroll_details, :employee_id
  end
end
