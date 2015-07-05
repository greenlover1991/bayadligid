class CreateMonthlyRates < ActiveRecord::Migration
  def change
    create_table :monthly_rates do |t|
      t.references :employee, :null=>false
      t.float :rate, :null=>false
      t.date :date_started, :null=>false
      t.date :date_ended

      t.timestamps
    end
    add_index :monthly_rates, :employee_id
  end
end
