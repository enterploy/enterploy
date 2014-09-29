class UserApp < ActiveRecord::Base
	belongs_to :user
	belongs_to :app, class_name: 'JobListing', foreign_key: 'app_id'

#***************
	state_machine :state, initial: :pending do
		after_transition on: :accept, do: :send_acceptance_email

		state :requested

		event :accept do
			transition any => :accepted
		end
	end
#***************
	def self.request(user, app)
		transaction do
			app_apply1 = create(user: user, app: app, state: 'pending')
			app_apply2 = create(user: app, app: user, state: 'requested')

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


end
