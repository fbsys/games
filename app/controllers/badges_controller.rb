class BadgesController < ApplicationController
  before_action :set_badge, only: [:show, :edit, :update, :destroy]
  before_action :set_badge_categories, only: [:new, :create]

  # GET /badges
  # GET /badges.json
  def index
    @badges = Badge.all
  end

  # GET /badges/1
  # GET /badges/1.json
  def show
  end

  # GET /badges/new
  def new
    @badge = Badge.new
  end

  # GET /badges/1/edit
  def edit
  end

  # POST /badges
  # POST /badges.json
  def create
    @badge = Badge.new(badge_params)
    flag = @badge.save
    @badge.file.destroy if !flag && @badge.file

    respond_to do |format|
      if flag
        format.html { redirect_to @badge, notice: 'Badge was successfully created.' }
        format.json { render :show, status: :created, location: @badge }
      else
        format.html { render :new }
        format.json { render json: @badge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /badges/1
  # PATCH/PUT /badges/1.json
  def update
    respond_to do |format|
      if @badge.update(badge_params)
        format.html { redirect_to @badge, notice: 'Badge was successfully updated.' }
        format.json { render :show, status: :ok, location: @badge }
      else
        format.html { render :edit }
        format.json { render json: @badge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /badges/1
  # DELETE /badges/1.json
  def destroy
    @badge.destroy
    respond_to do |format|
      format.html { redirect_to badges_url, notice: 'Badge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_badge
      @badge = Badge.find(params[:id])
      set_badge_categories
    end
    def set_badge_categories
        @badge_categories = BadgeCategory.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def badge_params
        #params[:badge]
        if params[:badge][:badge_image]
            uploadfile = UploadFile.save_badge_icon(params[:badge][:badge_image])
            uploadfile.save
            params[:badge][:upload_file_id] = uploadfile.id
        end
        params.require(:badge).permit(:name, :description, :upload_file_id, :badge_category_id)

    end
end
