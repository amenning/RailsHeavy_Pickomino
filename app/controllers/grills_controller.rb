class GrillsController < ApplicationController
  before_action :set_grill, only: [:show, :edit, :update, :destroy]

  # GET /grills
  # GET /grills.json
  def index
    @grills = Grill.all
  end

  # GET /grills/1
  # GET /grills/1.json
  def show
  end

  # GET /grills/new
  def new
    @grill = Grill.new
  end

  # GET /grills/1/edit
  def edit
  end

  # POST /grills
  # POST /grills.json
  def create
    @grill = Grill.new(grill_params)

    respond_to do |format|
      if @grill.save
        format.html { redirect_to @grill, notice: 'Grill was successfully created.' }
        format.json { render :show, status: :created, location: @grill }
      else
        format.html { render :new }
        format.json { render json: @grill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grills/1
  # PATCH/PUT /grills/1.json
  def update
    respond_to do |format|
      if @grill.update(grill_params)
        format.html { redirect_to @grill, notice: 'Grill was successfully updated.' }
        format.json { render :show, status: :ok, location: @grill }
      else
        format.html { render :edit }
        format.json { render json: @grill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grills/1
  # DELETE /grills/1.json
  def destroy
    @grill.destroy
    respond_to do |format|
      format.html { redirect_to grills_url, notice: 'Grill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grill
      @grill = Grill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grill_params
      params.require(:grill).permit(:game_id)
    end
end
