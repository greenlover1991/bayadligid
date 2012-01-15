class CreateAppliedLoans < ActiveRecord::Migration
  def change
    create_table :applied_loans do |t|
      t.references :employee, :null=>false
      t.references :loan, :null=>false
      t.date :date_started, :null=>false
      t.date :date_ended, :null=>false
      t.integer :days_interval, :null=>false
      t.float :amount_per_interval, :null=>false
      t.float :original_amount, :null=>false
      t.float :remaining_balance

      t.timestamps
    end
    add_index :applied_loans, :employee_id
    add_index :applied_loans, :loan_id
  end
end
