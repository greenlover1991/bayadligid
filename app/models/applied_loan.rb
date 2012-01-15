class AppliedLoan < ActiveRecord::Base
  belongs_to :employee
  belongs_to :loan
  has_many :applied_loan_details, :dependent=>:destroy
  
  @@INTERVAL_TYPES = ["Weekly", "Monthly"]
  
  validates_presence_of :date_started, :interval_type, :amount_per_interval, :original_amount
  validate :date_started_cannot_be_greater_than_date_ended
  validates :amount_per_interval, :numericality=>{ :greater_than => 0 }
  validates :original_amount, :numericality=>{ :greater_than => 0 }
	validates :interval_type, :inclusion=>{:in=>@@INTERVAL_TYPES, :message=>"%{value} is not a valid interval type."}
	
  before_save :calculate_date_ended_and_create_details
  after_save :update_applied_loan_details
 
  
  def self.interval_types
  	@@INTERVAL_TYPES
  end
  
	def remaining_balance
		start_date = self.date_started
		balance = self.original_amount
		if(self.interval_type == "Weekly")
				while start_date < Date.today
					balance -= self.amount_per_interval
					start_date += 7.days
  			end
		elsif(self.interval_type == "Monthly")
			if(start_date.day > 25) 
				start_day = 10
				start_date += 1.month
			else 
				start_day =	start_date.day
			end
			while start_date < Date.today
				balance -= self.amount_per_interval
				from = Date.parse("#{start_day}/#{start_date.month}/#{start_date.year}")				
				if(start_day == 10)
					start_day = 25
				else
					start_day = 10  				
					start_date += 1.month
				end
			end
		end
		return balance
	end
  
  
  
  private 
  	def calculate_date_ended_and_create_details
  		amount = self.original_amount
			@intervals = 0
			
			while amount > 0 
				@intervals += 1
				amount -= self.amount_per_interval 
			end
			
  		if(self.interval_type == "Weekly")
				self.date_ended = self.date_started + (7*(@intervals-1)).days
			elsif(self.interval_type == "Monthly")
  			self.date_ended = get_last_date
  		end
  		
  	end
  	
  	def get_last_date
  		from = self.date_started
  		if from.day <= 10
				day = (@intervals%2==0) ? 25 : 10
				from += ((@intervals-1)/2).months
			elsif from.day <= 25
				day = (@intervals%2==0) ? 10 : 25
				from += (@intervals/2).months
			else
				day = (@intervals%2==0) ? 25 : 10
				from += ((@intervals+1)/2).months
			end
			Date.parse("#{day}/#{from.month}/#{from.year}")
  	end
  	
  	def update_applied_loan_details
  		AppliedLoanDetail.delete_all(:applied_loan_id=>self.id)

			start_date = self.date_started  	
  		if(self.interval_type == "Weekly")
				@intervals.times do
					AppliedLoanDetail.create(:applied_loan_id=>self.id, :amount=>self.amount_per_interval, :date_applied=>start_date)	
					start_date += 7.days
  			end
			elsif(self.interval_type == "Monthly")
				
				if(start_date.day > 25) 
					start_day = 10
					start_date += 1.month
				else 
					start_day =	start_date.day
				end
				@intervals.times do
					d = Date.parse("#{start_day}/#{start_date.month}/#{start_date.year}")				
					if(start_day == 10)
						start_day = 25
					else
						start_day = 10  				
						start_date += 1.month
					end
					AppliedLoanDetail.create(:applied_loan_id=>self.id, :amount=>self.amount_per_interval, :date_applied=>d)
				end
			end
  		
  	end
  	

  	
	  def date_started_cannot_be_greater_than_date_ended
	  	if !date_ended.nil? and date_started > date_ended
        errors.add(:date_started, "can't be later than date ended")
      end
	  end
  
end
