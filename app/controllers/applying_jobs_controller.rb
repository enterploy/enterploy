class ApplyingJobsController < ApplicationController
	
	before_action :require_user
	before_action :set_applying_job, only: [:show, :edit, :update, :destroy]
	
	def new 
		if params[:job_listing_id]

			@job_listing = JobListing.find(params[:job_listing_id])

			@applying_job = current_user.applying_jobs.new(job_listing: @job_listing)


		else
			flash[:error] = "Job Listing Required"
		end

	rescue ActiveRecord::RecordNotFound
		render file: 'public/404', status: :not_found
	end


	def create
	    if params[:job_listing_id]
	      @job_listing = JobListing.find(params[:job_listing_id])
	      @applying_job = current_user.applying_jobs.new(job_listing: @job_listing)
	      
	      if @applying_job.save
	        flash[:success] = "Friendship created."
	    else
	        flash[:error] = "There was a problem."
	    end
	      redirect_to users_path
	    else
	      flash[:error] = "Friend required"
	      redirect_to root_path
	    end
  	end







	def set_applying_job
      @applying_job = ApplyingJob.find(params[:id])
    end

	def applying_job_params
      params.require(:applying_job).permit(:user_id, :user, :job_listing_id, :job_listing)
    end
end
