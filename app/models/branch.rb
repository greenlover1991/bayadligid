class Branch < ActiveRecord::Base
  belongs_to :company
  has_many :employees, :dependent=>:destroy
  validates_presence_of :name, :company
  
  def pretty_branches
  	self.company.name + " - " + self.name
  end
  
  def self.available_branches
  	# include user validation later
  	Branch.joins(:company).order("'companies'.'name', 'branches'.'name'")
  end
end

