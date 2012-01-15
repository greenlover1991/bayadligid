class CreateHolidays < ActiveRecord::Migration
  def change
    create_table :holidays do |t|
      t.string :name, :null=>false
      t.string :holiday_type, :null=>false, :default => "Regular"
      t.date :date_of_holiday, :null=>false

      t.timestamps
    end
  end
end
