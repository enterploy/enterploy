class JobListing < ActiveRecord::Base
	belongs_to :user
	belongs_to :company_profile

	# def location
	# 	self.company_city + ", " + self.company_state
	# end
end
