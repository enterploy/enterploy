class EmploymentsController < ApplicationController
  before_action :require_user
  before_action :set_employment, only: [:show, :edit, :update, :destroy]

  # GET /employments
  # GET /employments.json
  def index
    @employments = current_user.employments
  end

  # GET /employments/1
  # GET /employments/1.json
  def show
  end

  # GET /employments/new
  def new
    @employment = current_user.employments.new
  end

  # GET /employments/1/edit
  def edit
  end

  # POST /employments
  # POST /employments.json
  def create
    @employment = current_user.employments.new(employment_params)

    respond_to do |format|
      if @employment.save
        format.html { redirect_to user_path(@current_user), notice: 'Employment was successfully created.' }
        format.json { render :show, status: :created, location: @employment }
      else
        format.html { render :new }
        format.json { render json: @employment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employments/1
  # PATCH/PUT /employments/1.json
  def update
    respond_to do |format|
      if @employment.update(employment_params)
        format.html { redirect_to user_path(@current_user), notice: 'Employment was successfully updated.' }
        format.json { render :show, status: :ok, location: @employment }
      else
        format.html { render :edit }
        format.json { render json: @employment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employments/1
  # DELETE /employments/1.json
  def destroy
    @employment.destroy
    respond_to do |format|
      format.html { redirect_to user_path(@current_user), notice: 'Employment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employment
      @employment = current_user.employments.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employment_params
      params.require(:employment).permit(:job_cateorgy, :name_of_company, :city_of_company, :state_of_company, :contact_name, :contact_number, :job_title, :full_part_time, :skills_learned, :reason_for_leaving,:start_date, :end_date, :user_id)
    end
end
