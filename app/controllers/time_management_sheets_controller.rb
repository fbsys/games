class TimeManagementSheetsController < ApplicationController
  before_action :set_time_management_sheet, only: [:show, :edit, :update, :destroy]
  before_action :current_admin_check

  # GET /time_management_sheets
  # GET /time_management_sheets.json
  def index
    @time_management_sheets = TimeManagementSheet.all
  end

  # GET /time_management_sheets/1
  # GET /time_management_sheets/1.json
  def show
  end

  # GET /time_management_sheets/new
  def new
    @time_management_sheet = TimeManagementSheet.new
    @upload_file = ""
  end

  # GET /time_management_sheets/1/edit
  def edit
  end

  # POST /time_management_sheets
  # POST /time_management_sheets.json
  def create
    @time_management_sheet = TimeManagementSheet.new(time_management_sheet_params)

    respond_to do |format|
      if @time_management_sheet.save
        format.html { redirect_to @time_management_sheet, notice: 'Time management sheet was successfully created.' }
        format.json { render :show, status: :created, location: @time_management_sheet }
      else
        format.html { render :new }
        format.json { render json: @time_management_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_management_sheets/1
  # PATCH/PUT /time_management_sheets/1.json
  def update
    respond_to do |format|
      if @time_management_sheet.update(time_management_sheet_params)
        format.html { redirect_to @time_management_sheet, notice: 'Time management sheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @time_management_sheet }
      else
        format.html { render :edit }
        format.json { render json: @time_management_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_management_sheets/1
  # DELETE /time_management_sheets/1.json
  def destroy
    @time_management_sheet.destroy
    respond_to do |format|
      format.html { redirect_to time_management_sheets_url, notice: 'Time management sheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upload
    @time_management_sheet = TimeManagementSheet.new
    @upload_file = ""

    respond_to do |format|
      #if @time_management_sheet.save
      if false
        format.html { redirect_to @time_management_sheet, notice: 'Time management sheet was successfully created.' }
        format.json { render :show, status: :created, location: @time_management_sheet }
      else
        format.html { render :new }
        format.json { render json: @time_management_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_management_sheet
      @time_management_sheet = TimeManagementSheet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def time_management_sheet_params
      params.require(:time_management_sheet).permit(:year, :month, :employee_num, :company_name, :department_code, :instruction_id, :team_code, :work_task_id, :work_process_id, :man_hour)
    end
end
