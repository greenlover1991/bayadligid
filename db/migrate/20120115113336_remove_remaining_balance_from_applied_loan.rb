class RemoveRemainingBalanceFromAppliedLoan < ActiveRecord::Migration
  def up
  	remove_column :applied_loans, :remaining_balance
  end

  def down
  end
end
