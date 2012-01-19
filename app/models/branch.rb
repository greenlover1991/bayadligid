class Branch < ActiveRecord::Base
  belongs_to :company
  has_many :employees, :dependent=>:destroy
  has_many :users, :through=>:company
  validates_presence_of :name, :company
  
  def pretty_branches
  	self.company.name + " - " + self.name
  end
  
  def self.available_branches(user_id)
	b = Branch.joins(:users).where("users.id=#{user_id}").order("companies.name, branches.name").includes(:company)
	return b		
  end
end

