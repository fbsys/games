class AvatarsController < ApplicationController
  before_action :set_avatar, only: [:show, :edit, :update, :destroy]

  # GET /avatars
  # GET /avatars.json
  def index
    @avatars = Avatar.all
  end

  # GET /avatars/1
  # GET /avatars/1.json
  def show
  end

  # GET /avatars/new
  def new
    @avatar = Avatar.new
  end

  # GET /avatars/1/edit
  def edit
  end

  # POST /avatars
  # POST /avatars.json
  def create
    created = false
    @avatar = Avatar.new
    
    if params[:avatar] && params[:avatar][:upload_file] && !params[:avatar][:upload_file].to_s.empty?
      @upload_file_path = UploadFile.make_diskfile(params[:avatar][:upload_file])
      @avatar = Avatar.make(@upload_file_path)
      created = @avatar.save if @avatar
      @avatar = Avatar.new if !@avatar
    else
      #todo:error message
      #@avatar.errors.messages[:error] = "please choose your time management sheet"
    end
    
    #delete_files
    @upload_file = ""
    
    respond_to do |format|
      if created
        format.html { redirect_to @avatar, notice: 'Avatar was successfully created.' }
        format.json { render :show, status: :created, location: @avatar }
      else
        format.html { render :new }
        format.json { render json: @avatar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /avatars/1
  # PATCH/PUT /avatars/1.json
  def update
    respond_to do |format|
      if @avatar.update(avatar_params)
        format.html { redirect_to @avatar, notice: 'Avatar was successfully updated.' }
        format.json { render :show, status: :ok, location: @avatar }
      else
        format.html { render :edit }
        format.json { render json: @avatar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /avatars/1
  # DELETE /avatars/1.json
  def destroy
    @avatar.destroy
    respond_to do |format|
      format.html { redirect_to avatars_url, notice: 'Avatar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_avatar
      @avatar = Avatar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def avatar_params
      params.require(:avatar).permit(:year, :month, :employee_num, :company_name, :employee_name, :avatar_type, :strength, :constitution, :intelligence, :magic, :agility, :charm, :luck, :potential)
    end
end
