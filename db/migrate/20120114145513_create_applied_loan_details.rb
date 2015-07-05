class CreateAppliedLoanDetails < ActiveRecord::Migration
  def change
    create_table :applied_loan_details do |t|
      t.references :applied_loan
      t.float :amount
      t.date :date_applied

      t.timestamps
    end
    add_index :applied_loan_details, :applied_loan_id
  end
end
