class FrozenDicesController < ApplicationController
  before_action :set_frozen_dice, only: [:show, :edit, :update, :destroy]

  # GET /frozen_dices
  # GET /frozen_dices.json
  def index
    @frozen_dices = FrozenDice.all
  end

  # GET /frozen_dices/1
  # GET /frozen_dices/1.json
  def show; end

  # GET /frozen_dices/new
  def new
    @frozen_dice = FrozenDice.new
  end

  # GET /frozen_dices/1/edit
  def edit; end

  # POST /frozen_dices
  # POST /frozen_dices.json
  def create
    @frozen_dice = FrozenDice.new(frozen_dice_params)

    respond_to do |format|
      if @frozen_dice.save
        format.html { redirect_to @frozen_dice, notice: 'Frozen dice was successfully created.' }
        format.json { render :show, status: :created, location: @frozen_dice }
      else
        format.html { render :new }
        format.json { render json: @frozen_dice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /frozen_dices/1
  # PATCH/PUT /frozen_dices/1.json
  def update
    respond_to do |format|
      if @frozen_dice.update(frozen_dice_params)
        format.html { redirect_to @frozen_dice, notice: 'Frozen dice was successfully updated.' }
        format.json { render :show, status: :ok, location: @frozen_dice }
      else
        format.html { render :edit }
        format.json { render json: @frozen_dice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /frozen_dices/1
  # DELETE /frozen_dices/1.json
  def destroy
    @frozen_dice.destroy
    respond_to do |format|
      format.html { redirect_to frozen_dices_url, notice: 'Frozen dice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_frozen_dice
    @frozen_dice = FrozenDice.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def frozen_dice_params
    params.require(:frozen_dice).permit(:frozen_dice_set_id)
  end
end
