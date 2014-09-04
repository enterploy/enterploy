class ApplyingJobs < ActiveRecord::Base
	
	belongs_to :user
	belongs_to :job_listing
	
	
end
