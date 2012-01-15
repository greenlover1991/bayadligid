class CreatePayrolls < ActiveRecord::Migration
  def change
    create_table :payrolls do |t|
      t.date :date_started, :null=>false
      t.date :date_ended, :null=>false
      t.boolean :is_weekly, :null=>false, :default=>true

      t.timestamps
    end
  end
end
