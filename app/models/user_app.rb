class UserApp < ActiveRecord::Base
	belongs_to :user
	belongs_to :company, class_name: 'User', foreign_key: 'company_id'
	belongs_to :app, class_name: 'JobListing', foreign_key: 'app_id'

#***************
	 scope :accepted, -> { where(state: 'accepted') }
 	 scope :pending,  -> { where(state: 'pending') }

 	 after_destroy :delete_mutal_application!

  	# validates :app_id, uniqueness: { scope: :user_id }

	state_machine :state, initial: :pending do
		after_transition on: :accept, do: [:send_acceptance_email, :accept_mutal_application!]

		state :requested

		event :accept do
			transition any => :accepted
		end
	end
#***************
	def self.request(user, app, company) #(current_user, @app)
		transaction do
			app_apply1 = create(user: user, app: app, company: company, state: 'pending')
			app_apply2 = create(user: company, app: app, company: user, state: 'requested')

			# app_apply2 = create(user: @app, app: @current_user, state: 'requested')

			app_apply1.send_request_email 
			app_apply1
		end
	end

	def send_request_email
		UserNotifer.app_requested(id).deliver
	end

	def send_acceptance_email
		UserNotifer.app_request_accepted(id).deliver
	end

	def mutal_application
		self.class.where({user_id: company_id, company_id: user_id}).first
	end

	def accept_mutal_application!
		# Grab the mutal user_app and update the state w/o using
		# the state machine so as not to invoke callbacks.
		mutal_application = self.class.where({user_id: company_id, company_id: user_id}).first
		mutal_application.update_attribute(:state, 'accepted')
	end
	def delete_mutal_application!
		mutal_application.delete
	end

end
