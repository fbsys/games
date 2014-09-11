class BadgeConditionsController < ApplicationController
  before_action :set_badge_condition, only: [:show, :edit, :update, :destroy]
  before_action :current_admin_check

  # GET /badge_conditions
  # GET /badge_conditions.json
  def index
    @badge_conditions = BadgeCondition.all
  end

  # GET /badge_conditions/1
  # GET /badge_conditions/1.json
  def show
  end

  # GET /badge_conditions/new
  def new
    @badge_condition = BadgeCondition.new
  end

  # GET /badge_conditions/1/edit
  def edit
  end

  # POST /badge_conditions
  # POST /badge_conditions.json
  def create
    @badge_condition = BadgeCondition.new(badge_condition_params)

    respond_to do |format|
      if @badge_condition.save
        format.html { redirect_to @badge_condition, notice: 'Badge condition was successfully created.' }
        format.json { render :show, status: :created, location: @badge_condition }
      else
        format.html { render :new }
        format.json { render json: @badge_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /badge_conditions/1
  # PATCH/PUT /badge_conditions/1.json
  def update
    respond_to do |format|
      if @badge_condition.update(badge_condition_params)
        format.html { redirect_to @badge_condition, notice: 'Badge condition was successfully updated.' }
        format.json { render :show, status: :ok, location: @badge_condition }
      else
        format.html { render :edit }
        format.json { render json: @badge_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /badge_conditions/1
  # DELETE /badge_conditions/1.json
  def destroy
    @badge_condition.destroy
    respond_to do |format|
      format.html { redirect_to badge_conditions_url, notice: 'Badge condition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_badge_condition
      @badge_condition = BadgeCondition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def badge_condition_params
      params[:badge_condition]
    end
end
