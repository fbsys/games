class InstrucionsController < ApplicationController
  before_action :set_instrucion, only: [:show, :edit, :update, :destroy]

  # GET /instrucions
  # GET /instrucions.json
  def index
    @instrucions = Instrucion.all
  end

  # GET /instrucions/1
  # GET /instrucions/1.json
  def show
  end

  # GET /instrucions/new
  def new
    @instrucion = Instrucion.new
  end

  # GET /instrucions/1/edit
  def edit
  end

  # POST /instrucions
  # POST /instrucions.json
  def create
    @instrucion = Instrucion.new(instrucion_params)

    respond_to do |format|
      if @instrucion.save
        format.html { redirect_to @instrucion, notice: 'Instrucion was successfully created.' }
        format.json { render :show, status: :created, location: @instrucion }
      else
        format.html { render :new }
        format.json { render json: @instrucion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instrucions/1
  # PATCH/PUT /instrucions/1.json
  def update
    respond_to do |format|
      if @instrucion.update(instrucion_params)
        format.html { redirect_to @instrucion, notice: 'Instrucion was successfully updated.' }
        format.json { render :show, status: :ok, location: @instrucion }
      else
        format.html { render :edit }
        format.json { render json: @instrucion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instrucions/1
  # DELETE /instrucions/1.json
  def destroy
    @instrucion.destroy
    respond_to do |format|
      format.html { redirect_to instrucions_url, notice: 'Instrucion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instrucion
      @instrucion = Instrucion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instrucion_params
      params[:instrucion]
    end
end
