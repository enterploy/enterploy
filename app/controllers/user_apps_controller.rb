class UserAppsController < ApplicationController
	before_action :require_user

	def index
		@user_apps = current_user.user_apps.all
	end

	def accept
		@user_app = current_user.user_apps.find(params[:id])
		if @user_app.accept!
			flash[:success] = "You have becan the hiring process for this application"
		else
			flash[:error] = "there was a problem accepting this application"
		end
		redirect_to user_path(current_user)
	end

	
	def new
		if params[:app_id]
			@app = JobListing.find(params[:app_id])
			# @company = User.find(params[:company_id])
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
			@company = User.find(params[:user_app][:company_id])
			@user_app = UserApp.request(current_user, @app, @company)
			if @user_app.new_record?
				flash[:error] = "Sorry, your application can not be processed at this time."
			else
				flash[:notice] = "Your Application has been sent to " + @app.company_name 
			end
			redirect_to user_path(current_user)
		else
			flash[:error] = "Company Required"
			redirect_to users_path
		end
	end

	def edit
		@user_app = current_user.user_apps.find(params[:id])
		@app = @user_app.app
		@applied_user = @user_app.company #this finds the user who applied for the job, only revelant for the company. 
	end

	def destroy
		@user_app = current_user.user_apps.find(params[:id])
		if @user_app.destroy
			flash[:notice] = "You have terminated the hiring process."
		end
		redirect_to user_apps_path
	end


	private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user_app).permit(:user, :app, :user_id, :app_id, :state, :company, :company_id)
    end

end
