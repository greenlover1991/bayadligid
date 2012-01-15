class RemoveIsWeeklyFromPayrolls < ActiveRecord::Migration
  def up
  	remove_column :payrolls,:is_weekly
  end

  def down
  end
end
