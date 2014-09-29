class UserAppsController < ApplicationController
	before_action :require_user

	def index
		@user_apps = current_user.user_apps.all
	end

	def accept
		@user_app = current_user.user_apps.find(params[:id])
		if @user_app.accepted!
			flash[:success] = "You have accepted this application"
		else
			flash[:error] = "there was a problem accepting this application"
		end
		redirect_to user_apps_path
	end

	
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

	# def create
	#     if params[:user_app] && params[:user_app].has_key?(:app_id)
	#       @app = JobListing.where(company_name: params[:user_app][:app_id]).first
	#       @user_app = UserApp.request(current_user, @app)
	#       respond_to do |format|
	#         if @user_app.new_record?
	#           format.html { flash[:error] = "There was a problem."; redirect_to user_path(current_user) }
	#           format.json { render json: @user_app.to_json, status: :precondition_failed }
	#         else
	#           format.html { flash[:success] = "Friendship created."; redirect_to user_path(current_user) }
	#           format.json { render json: @user_app.to_json }
	#         end
	#       end
	#     else
	#       flash[:error] = "Friend required"
	#       redirect_to root_path
	#     end
 # 	end

	def edit
		@user_app = current_user.user_apps.find(params[:id])
		@app = @user_app.app
	end



	private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user_app).permit(:user, :app, :user_id, :app_id, :state)
    end

end
