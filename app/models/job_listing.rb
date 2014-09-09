class JobListing < ActiveRecord::Base
	belongs_to :user

	def location
		self.company_city + ", " + self.company_state
	end
end
