class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login, :null=>false
      t.string :password, :null=>false
      t.references :employee

      t.timestamps
    end
    add_index :users, :employee_id
  end
end
