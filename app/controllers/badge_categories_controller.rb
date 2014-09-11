class BadgeCategoriesController < ApplicationController
  before_action :set_badge_category, only: [:show, :edit, :update, :destroy]
  before_action :current_admin_check

  # GET /badge_categories
  # GET /badge_categories.json
  def index
    @badge_categories = BadgeCategory.all
  end

  # GET /badge_categories/1
  # GET /badge_categories/1.json
  def show
  end

  # GET /badge_categories/new
  def new
    @badge_category = BadgeCategory.new
  end

  # GET /badge_categories/1/edit
  def edit
  end

  # POST /badge_categories
  # POST /badge_categories.json
  def create
    @badge_category = BadgeCategory.new(badge_category_params)

    respond_to do |format|
      if @badge_category.save
        format.html { redirect_to @badge_category, notice: 'Badge category was successfully created.' }
        format.json { render :show, status: :created, location: @badge_category }
      else
        format.html { render :new }
        format.json { render json: @badge_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /badge_categories/1
  # PATCH/PUT /badge_categories/1.json
  def update
    respond_to do |format|
      if @badge_category.update(badge_category_params)
        format.html { redirect_to @badge_category, notice: 'Badge category was successfully updated.' }
        format.json { render :show, status: :ok, location: @badge_category }
      else
        format.html { render :edit }
        format.json { render json: @badge_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /badge_categories/1
  # DELETE /badge_categories/1.json
  def destroy
    @badge_category.destroy
    respond_to do |format|
      format.html { redirect_to badge_categories_url, notice: 'Badge category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_badge_category
      @badge_category = BadgeCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def badge_category_params
      #params[:badge_category]
      params.require(:badge_category).permit(:name)
    end
end
