class ActiveDicesController < ApplicationController
  before_action :set_active_dice, only: [:show, :edit, :update, :destroy]

  # GET /active_dices
  # GET /active_dices.json
  def index
    @active_dices = ActiveDice.all
  end

  # GET /active_dices/1
  # GET /active_dices/1.json
  def show
  end

  # GET /active_dices/new
  def new
    @active_dice = ActiveDice.new
  end

  # GET /active_dices/1/edit
  def edit
  end

  # POST /active_dices
  # POST /active_dices.json
  def create
    @active_dice = ActiveDice.new(active_dice_params)

    respond_to do |format|
      if @active_dice.save
        format.html { redirect_to @active_dice, notice: 'Active dice was successfully created.' }
        format.json { render :show, status: :created, location: @active_dice }
      else
        format.html { render :new }
        format.json { render json: @active_dice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /active_dices/1
  # PATCH/PUT /active_dices/1.json
  def update
    respond_to do |format|
      if @active_dice.update(active_dice_params)
        format.html { redirect_to @active_dice, notice: 'Active dice was successfully updated.' }
        format.json { render :show, status: :ok, location: @active_dice }
      else
        format.html { render :edit }
        format.json { render json: @active_dice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /active_dices/1
  # DELETE /active_dices/1.json
  def destroy
    @active_dice.destroy
    respond_to do |format|
      format.html { redirect_to active_dices_url, notice: 'Active dice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_active_dice
      @active_dice = ActiveDice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def active_dice_params
      params.require(:active_dice).permit(:active_dice_set_id, :dice_id, :can_freeze)
    end
end
