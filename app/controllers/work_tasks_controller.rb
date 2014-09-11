class WorkTasksController < ApplicationController
  before_action :set_work_task, only: [:show, :edit, :update, :destroy]
  before_action :current_admin_check

  # GET /work_tasks
  # GET /work_tasks.json
  def index
    @work_tasks = WorkTask.all
  end

  # GET /work_tasks/1
  # GET /work_tasks/1.json
  def show
  end

  # GET /work_tasks/new
  def new
    @work_task = WorkTask.new
  end

  # GET /work_tasks/1/edit
  def edit
  end

  # POST /work_tasks
  # POST /work_tasks.json
  def create
    @work_task = WorkTask.new(work_task_params)

    respond_to do |format|
      if @work_task.save
        format.html { redirect_to @work_task, notice: 'Work task was successfully created.' }
        format.json { render :show, status: :created, location: @work_task }
      else
        format.html { render :new }
        format.json { render json: @work_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_tasks/1
  # PATCH/PUT /work_tasks/1.json
  def update
    respond_to do |format|
      if @work_task.update(work_task_params)
        format.html { redirect_to @work_task, notice: 'Work task was successfully updated.' }
        format.json { render :show, status: :ok, location: @work_task }
      else
        format.html { render :edit }
        format.json { render json: @work_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_tasks/1
  # DELETE /work_tasks/1.json
  def destroy
    @work_task.destroy
    respond_to do |format|
      format.html { redirect_to work_tasks_url, notice: 'Work task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_task
      @work_task = WorkTask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_task_params
      params.require(:work_task).permit(:id, :task_code, :status_type, :name)
    end
end
