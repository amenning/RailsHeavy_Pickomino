class FrozenDiceStatusesController < ApplicationController
  before_action :set_frozen_dice_status, only: [:show, :edit, :update, :destroy]

  # GET /frozen_dice_statuses
  # GET /frozen_dice_statuses.json
  def index
    @frozen_dice_statuses = FrozenDiceStatus.all
  end

  # GET /frozen_dice_statuses/1
  # GET /frozen_dice_statuses/1.json
  def show
  end

  # GET /frozen_dice_statuses/new
  def new
    @frozen_dice_status = FrozenDiceStatus.new
  end

  # GET /frozen_dice_statuses/1/edit
  def edit
  end

  # POST /frozen_dice_statuses
  # POST /frozen_dice_statuses.json
  def create
    @frozen_dice_status = FrozenDiceStatus.new(frozen_dice_status_params)

    respond_to do |format|
      if @frozen_dice_status.save
        format.html { redirect_to @frozen_dice_status, notice: 'Frozen dice status was successfully created.' }
        format.json { render :show, status: :created, location: @frozen_dice_status }
      else
        format.html { render :new }
        format.json { render json: @frozen_dice_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /frozen_dice_statuses/1
  # PATCH/PUT /frozen_dice_statuses/1.json
  def update
    respond_to do |format|
      if @frozen_dice_status.update(frozen_dice_status_params)
        format.html { redirect_to @frozen_dice_status, notice: 'Frozen dice status was successfully updated.' }
        format.json { render :show, status: :ok, location: @frozen_dice_status }
      else
        format.html { render :edit }
        format.json { render json: @frozen_dice_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /frozen_dice_statuses/1
  # DELETE /frozen_dice_statuses/1.json
  def destroy
    @frozen_dice_status.destroy
    respond_to do |format|
      format.html { redirect_to frozen_dice_statuses_url, notice: 'Frozen dice status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_frozen_dice_status
      @frozen_dice_status = FrozenDiceStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def frozen_dice_status_params
      params.require(:frozen_dice_status).permit(:game_id, :total, :has_worm)
    end
end
