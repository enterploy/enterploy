class TheApplicationsController < ApplicationController
  before_action :require_user
  before_action :set_the_application, only: [:show, :edit, :update, :destroy]

  # GET /the_applications
  # GET /the_applications.json
  def index
    @the_application = current_user.the_applications
  end

  # GET /the_applications/1
  # GET /the_applications/1.json
  def show
  end

  # GET /the_applications/new
  def new
    @the_application = current_user.the_applications.new
  end

  # GET /the_applications/1/edit
  def edit
  end

  # POST /the_applications
  # POST /the_applications.json
  def create
    @the_application = current_user.the_applications.new(the_application_params)

    respond_to do |format|
      if @the_application.save
        format.html { redirect_to users_path, notice: 'The application was successfully created.' }
        format.json { render :show, status: :created, location: @the_application }
      else
        format.html { render :new }
        format.json { render json: @the_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /the_applications/1
  # PATCH/PUT /the_applications/1.json
  def update
    respond_to do |format|
      if @the_application.update(the_application_params)
        format.html { redirect_to users_path, notice: 'The application was successfully updated.' }
        format.json { render :show, status: :ok, location: @the_application }
      else
        format.html { render :edit }
        format.json { render json: @the_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /the_applications/1
  # DELETE /the_applications/1.json
  def destroy
    @the_application.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'The application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_the_application
      @the_application = current_user.the_applications.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def the_application_params
      params.require(:the_application).permit(:bitrhday, :street_address, :city, :state, :zip_code, :country, :phone_number, :created_at, :updated_at, :eligable_to_work)
    end
end
