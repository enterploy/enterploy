class TheApplication < ActiveRecord::Base
	#links an application to the corrsponding user.
	belongs_to :user

	#example for how to make a field mandatory,
	# validates :first_name, presence: true
	# validates :first_name, length:{minimum: 2}


end
