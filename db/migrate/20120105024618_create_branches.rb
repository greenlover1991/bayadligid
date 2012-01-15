class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :name, :null=>false
			t.references :company, :null=>false
      t.timestamps
    end
		add_index :branches, :company_id
  end
end
