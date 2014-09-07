class BadgeLogsController < ApplicationController
  before_action :set_badge_log, only: [:show, :edit, :update, :destroy]

  # GET /badge_logs
  # GET /badge_logs.json
  def index
    @badge_logs = BadgeLog.all
  end

  # GET /badge_logs/1
  # GET /badge_logs/1.json
  def show
  end

  # GET /badge_logs/new
  def new
    @badge_log = BadgeLog.new
    @badges = Badge.all
    @users = User.all
  end

  # GET /badge_logs/1/edit
  def edit
    @badges = Badge.all
    @users = User.all
  end

  # POST /badge_logs
  # POST /badge_logs.json
  def create
    @badge_log = BadgeLog.new(badge_log_params)

    respond_to do |format|
      if @badge_log.save
        #format.html { redirect_to @badge_log, notice: 'Badge log was successfully created.' }
        #format.json { render :show, status: :created, location: @badge_log }
        @badge_logs = BadgeLog.all
        format.html { render :index, notice: 'Badge log was successfully created.' }
        format.json { render :index, status: :created, location: @badge_log }
      else
        format.html { render :new }
        format.json { render json: @badge_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /badge_logs/1
  # PATCH/PUT /badge_logs/1.json
  def update
    respond_to do |format|
      if @badge_log.update(badge_log_params)
        format.html { redirect_to @badge_log, notice: 'Badge log was successfully updated.' }
        format.json { render :show, status: :ok, location: @badge_log }
      else
        format.html { render :edit }
        format.json { render json: @badge_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /badge_logs/1
  # DELETE /badge_logs/1.json
  def destroy
    @badge_log.destroy
    respond_to do |format|
      format.html { redirect_to badge_logs_url, notice: 'Badge log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_badge_log
      @badge_log = BadgeLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def badge_log_params
      #params[:badge_log]
      params[:badge_log][:from_user_id] = current_user.id
      params.require(:badge_log).permit(:badge_id, :to_user_id, :from_user_id, :description)
    end
end
