class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name, :null=>false
      t.string :middle_name, :null=>false
      t.string :last_name, :null=>false
      t.text :address
      t.string :phone_no
      t.string :mobile_no
      t.date :birthdate
      t.date :date_hired
      t.date :date_regularized
      t.date :date_left
      t.string :sss_no
      t.string :philhealth_no
      t.string :pagibig_no
      t.string :civil_status
      t.string :status, :null=>false, :default=>"Active"
      t.references :branch, :null=>false

      t.timestamps
    end
    add_index :employees, :branch_id
  end
end
