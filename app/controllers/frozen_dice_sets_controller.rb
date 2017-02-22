class FrozenDiceSetsController < ApplicationController
  before_action :set_frozen_dice_set, only: [:show, :edit, :update, :destroy]

  # GET /frozen_dice_sets
  # GET /frozen_dice_sets.json
  def index
    @frozen_dice_sets = FrozenDiceSet.all
  end

  # GET /frozen_dice_sets/1
  # GET /frozen_dice_sets/1.json
  def show
  end

  # GET /frozen_dice_sets/new
  def new
    @frozen_dice_set = FrozenDiceSet.new
  end

  # GET /frozen_dice_sets/1/edit
  def edit
  end

  # POST /frozen_dice_sets
  # POST /frozen_dice_sets.json
  def create
    @frozen_dice_set = FrozenDiceSet.new(frozen_dice_set_params)

    respond_to do |format|
      if @frozen_dice_set.save
        format.html { redirect_to @frozen_dice_set, notice: 'Frozen dice set was successfully created.' }
        format.json { render :show, status: :created, location: @frozen_dice_set }
      else
        format.html { render :new }
        format.json { render json: @frozen_dice_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /frozen_dice_sets/1
  # PATCH/PUT /frozen_dice_sets/1.json
  def update
    respond_to do |format|
      if @frozen_dice_set.update(frozen_dice_set_params)
        format.html { redirect_to @frozen_dice_set, notice: 'Frozen dice set was successfully updated.' }
        format.json { render :show, status: :ok, location: @frozen_dice_set }
      else
        format.html { render :edit }
        format.json { render json: @frozen_dice_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /frozen_dice_sets/1
  # DELETE /frozen_dice_sets/1.json
  def destroy
    @frozen_dice_set.destroy
    respond_to do |format|
      format.html { redirect_to frozen_dice_sets_url, notice: 'Frozen dice set was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_frozen_dice_set
      @frozen_dice_set = FrozenDiceSet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def frozen_dice_set_params
      params.require(:frozen_dice_set).permit(:game_state_id, :dice_id)
    end
end
