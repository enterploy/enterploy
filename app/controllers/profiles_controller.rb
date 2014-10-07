class ProfilesController < ApplicationController
  def show
  	@user = User.find_by_company_name(params[:id])
  	@person = User.find_by_first_name(params[:id]) 
  	# Currently finding reg users by first Name, Need to change so That Users are found by full name. used in user_app index
  
  	if @user
  		render action: :show
  	elsif @person 
  		render action: :show_person
  	else
  	render file: 'public/404', status: 404, formats: [:html]
    end

  end
end

