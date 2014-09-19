class ProfilesController < ApplicationController
  def show
  	@user = User.find_by_company_name(params[:id])
  	# change to find_by_profile_name(params[:id])     but add the column profile name to the user table.
  	if @user
  		render action: :show
  	else
  	render file: 'public/404', status: 404, formats: [:html]
    end

  end
end
