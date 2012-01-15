class Branch < ActiveRecord::Base
  belongs_to :company
  has_many :employees, :dependent=>:destroy
  validates_presence_of :name, :company
  
  def pretty_branches
  	self.company.name + " - " + self.name
  end
  
  def self.available_branches(user_id)
  	branches = []
  	b = []
		User.find(user_id).companies.each do |c|
			branches << c.branches.order("'companies.name', 'branches.name'")
		end
		branches.flatten!
		branches.each {|br| b << br}
		
		return b
  end
end

