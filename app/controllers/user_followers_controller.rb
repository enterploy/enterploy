class UserFollowersController < ApplicationController
	before_action :require_user

	def new
		if params[:follower_id]
			@follower = User.find(params[:follower_id])
			@user_follower = current_user.user_followers.new(follower: @follower)
		else
			flash[:error] = "Company Required"
		end

	rescue ActiveRecord::RecordNotFound
		render file: 'public/404', status: :not_found
	end
	

	def create 
		if params[:user_follower] && params[:user_follower].has_key?(:follower_id)
			@follower = User.find(params[:user_follower][:follower_id])
			@user_follower = current_user.user_followers.new(follower: @follower)
			@user_follower.save
			redirect_to users_path
			flash[:notice] = "You are now following " + @follower.company_name 
		else
			flash[:error] = "Company Required"
			redirect_to users_path
		end
	end





	private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user_follower).permit(:user, :follower, :user_id, :follower_id)
    end

end
