class RemoveDaysIntervalInAppliedLoans < ActiveRecord::Migration
  def up
  	remove_column :applied_loans, :days_interval
  	add_column :applied_loans, :interval_type, :string
  end

  def down
  end
end
