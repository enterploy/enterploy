class UserApp < ActiveRecord::Base
	belongs_to :user
	belongs_to :app, class_name: 'User', foreign_key: 'app_id'

end
