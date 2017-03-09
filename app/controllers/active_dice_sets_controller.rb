class ActiveDiceSetsController < ApplicationController
  before_action :set_active_dice_set, only: [:show, :edit, :update, :destroy]

  # GET /active_dice_sets
  # GET /active_dice_sets.json
  def index
    @active_dice_sets = ActiveDiceSet.all
  end

  # GET /active_dice_sets/1
  # GET /active_dice_sets/1.json
  def show; end

  # GET /active_dice_sets/new
  def new
    @active_dice_set = ActiveDiceSet.new
  end

  # GET /active_dice_sets/1/edit
  def edit; end

  # POST /active_dice_sets
  # POST /active_dice_sets.json
  def create
    @active_dice_set = ActiveDiceSet.new(active_dice_set_params)

    respond_to do |format|
      if @active_dice_set.save
        format.html { redirect_to @active_dice_set, notice: 'Active dice set was successfully created.' }
        format.json { render :show, status: :created, location: @active_dice_set }
      else
        format.html { render :new }
        format.json { render json: @active_dice_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /active_dice_sets/1
  # PATCH/PUT /active_dice_sets/1.json
  def update
    respond_to do |format|
      if @active_dice_set.update(active_dice_set_params)
        format.html { redirect_to @active_dice_set, notice: 'Active dice set was successfully updated.' }
        format.json { render :show, status: :ok, location: @active_dice_set }
      else
        format.html { render :edit }
        format.json { render json: @active_dice_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /active_dice_sets/1
  # DELETE /active_dice_sets/1.json
  def destroy
    @active_dice_set.destroy
    respond_to do |format|
      format.html { redirect_to active_dice_sets_url, notice: 'Active dice set was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_active_dice_set
    @active_dice_set = ActiveDiceSet.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def active_dice_set_params
    params.require(:active_dice_set).permit(:game_id)
  end
end
