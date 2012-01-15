class CompaniesUsers < ActiveRecord::Migration
  def up
  	create_table :companies_users, :id=>false do |t|
      t.integer :company_id, :null=>false
      t.integer :user_id, :null=>false
    end
  end

  def down
  	drop_table :companies_users
  end
end
