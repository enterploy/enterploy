class User < ActiveRecord::Base
	has_secure_password

	# things specific to JOB SEEKERS
	has_many :the_applications
	has_many :educations
	has_many :employments

	# things specific to EMPLOYEE SEEKERS
	has_many :company_profiles
	has_many :job_listings

	# applys to both
	has_many :profile_pictures
	


	# Validation of inputs
	validates :first_name, presence: true, length:(2..50)

	validates :last_name, presence: true, length:(2..50)

	validates :email, presence: true, 
					  uniqueness: true,
					  format: {
                    	with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9\.-]+\.[A-Za-z]+\Z/
                  	  }
    validates :user_kind, presence: true

    #keeps all emails consistant and lowercase 
	before_save :downcase_email

	def full_name 
  		self.first_name + " " + self.last_name
  	end

	def downcase_email
		self.email = email.downcase
	end

	def generate_password_reset_token!
		update_attribute(:password_reset_token, SecureRandom.urlsafe_base64(48))
	end

end
