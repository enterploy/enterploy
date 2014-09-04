class JobListing < ActiveRecord::Base
	belongs_to :user
	# has_many :applying_jobs
	# has_many :users, :through => :applying_jobs

	def location
		self.company_city + ", " + self.company_state
	end
end
