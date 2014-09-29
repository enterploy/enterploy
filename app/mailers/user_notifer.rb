class UserNotifer < ActionMailer::Base
  default from: "customersupport@enterploy.com"

  def app_requested(user_app_id)
  	user_app = UserApp.find(user_app_id)

  	@user = user_app.user
  	@app = user_app.app

  	mail to: @app.notification_email,
  		subject: "#{@user.full_name} has sent you their application"

  end
end
