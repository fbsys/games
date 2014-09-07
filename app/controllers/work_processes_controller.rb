class WorkProcessesController < ApplicationController
  before_action :set_work_process, only: [:show, :edit, :update, :destroy]

  # GET /work_processes
  # GET /work_processes.json
  def index
    @work_processes = WorkProcess.all
  end

  # GET /work_processes/1
  # GET /work_processes/1.json
  def show
  end

  # GET /work_processes/new
  def new
    @work_process = WorkProcess.new
  end

  # GET /work_processes/1/edit
  def edit
  end

  # POST /work_processes
  # POST /work_processes.json
  def create
    @work_process = WorkProcess.new(work_process_params)

    respond_to do |format|
      if @work_process.save
        format.html { redirect_to @work_process, notice: 'Work process was successfully created.' }
        format.json { render :show, status: :created, location: @work_process }
      else
        format.html { render :new }
        format.json { render json: @work_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_processes/1
  # PATCH/PUT /work_processes/1.json
  def update
    respond_to do |format|
      if @work_process.update(work_process_params)
        format.html { redirect_to @work_process, notice: 'Work process was successfully updated.' }
        format.json { render :show, status: :ok, location: @work_process }
      else
        format.html { render :edit }
        format.json { render json: @work_process.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_processes/1
  # DELETE /work_processes/1.json
  def destroy
    @work_process.destroy
    respond_to do |format|
      format.html { redirect_to work_processes_url, notice: 'Work process was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_process
      @work_process = WorkProcess.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_process_params
      params.require(:work_process).permit(:id, :process_code, :status_type, :name)
    end
end
