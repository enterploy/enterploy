module AuthenticationHelpers
	def sign_in(user)
		controller.stub(:current_user)
	end
end