class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.string :name, :null=>false

      t.timestamps
    end
  end
end
