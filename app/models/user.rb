# == Schema Information
#
# Table name: users
#
#  id          :integer         not null, primary key
#  login       :string(255)     not null
#  password    :string(255)     not null
#  employee_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class User < ActiveRecord::Base
  belongs_to :employee
  
  has_and_belongs_to_many :roles
  has_and_belongs_to_many :companies
  
	validates_presence_of :login, :password
  validates_uniqueness_of :login
  
  before_save :hashify
  
  def self.login(user)
    return (User.find_by_login_and_password(user.login, Digest::SHA1.hexdigest(user.password)))
  end 
  
  
  private
		def hashify
		  self.password = Digest::SHA1.hexdigest(self.password)
		end
end
