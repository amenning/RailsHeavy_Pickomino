class GrillWormsController < ApplicationController
  before_action :set_grill_worm, only: [:show, :edit, :update, :destroy]

  # GET /grill_worms
  # GET /grill_worms.json
  def index
    @grill_worms = GrillWorm.all
  end

  # GET /grill_worms/1
  # GET /grill_worms/1.json
  def show
  end

  # GET /grill_worms/new
  def new
    @grill_worm = GrillWorm.new
  end

  # GET /grill_worms/1/edit
  def edit
  end

  # POST /grill_worms
  # POST /grill_worms.json
  def create
    @grill_worm = GrillWorm.new(grill_worm_params)

    respond_to do |format|
      if @grill_worm.save
        format.html { redirect_to @grill_worm, notice: 'Grill worm was successfully created.' }
        format.json { render :show, status: :created, location: @grill_worm }
      else
        format.html { render :new }
        format.json { render json: @grill_worm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grill_worms/1
  # PATCH/PUT /grill_worms/1.json
  def update
    respond_to do |format|
      if @grill_worm.update(grill_worm_params)
        format.html { redirect_to @grill_worm, notice: 'Grill worm was successfully updated.' }
        format.json { render :show, status: :ok, location: @grill_worm }
      else
        format.html { render :edit }
        format.json { render json: @grill_worm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grill_worms/1
  # DELETE /grill_worms/1.json
  def destroy
    @grill_worm.destroy
    respond_to do |format|
      format.html { redirect_to grill_worms_url, notice: 'Grill worm was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grill_worm
      @grill_worm = GrillWorm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grill_worm_params
      params.require(:grill_worm).permit(:grill_id, :worm_id, :can_take, :is_dead)
    end
end
