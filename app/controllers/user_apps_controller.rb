class UserAppsController < ApplicationController
	before_action :require_user

	def new
		if params[:app_id]
			@app = JobListing.find(params[:app_id])
			@user_app = current_user.user_apps.new(app: @app)
		else
			flash[:error] = "Application Required"
		end

	rescue ActiveRecord::RecordNotFound
		render file: 'public/404', status: :not_found
	end
	

	def create 
		if params[:user_app] && params[:user_app].has_key?(:app_id)
			@app = JobListing.find(params[:user_app][:app_id])
			@user_app = current_user.user_apps.new(app: @app)
			@user_app.save
			redirect_to user_path(current_user)
			flash[:notice] = "Your Application has been sent to " + @app.company_name 
		else
			flash[:error] = "Company Required"
			redirect_to users_path
		end
	end





	private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user_app).permit(:user, :app, :user_id, :app_id)
    end

end
