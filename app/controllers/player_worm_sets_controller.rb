class PlayerWormSetsController < ApplicationController
  before_action :set_player_worm_set, only: [:show, :edit, :update, :destroy]

  # GET /player_worm_sets
  # GET /player_worm_sets.json
  def index
    @player_worm_sets = PlayerWormSet.all
  end

  # GET /player_worm_sets/1
  # GET /player_worm_sets/1.json
  def show
  end

  # GET /player_worm_sets/new
  def new
    @player_worm_set = PlayerWormSet.new
  end

  # GET /player_worm_sets/1/edit
  def edit
  end

  # POST /player_worm_sets
  # POST /player_worm_sets.json
  def create
    @player_worm_set = PlayerWormSet.new(player_worm_set_params)

    respond_to do |format|
      if @player_worm_set.save
        format.html { redirect_to @player_worm_set, notice: 'Player worm set was successfully created.' }
        format.json { render :show, status: :created, location: @player_worm_set }
      else
        format.html { render :new }
        format.json { render json: @player_worm_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /player_worm_sets/1
  # PATCH/PUT /player_worm_sets/1.json
  def update
    respond_to do |format|
      if @player_worm_set.update(player_worm_set_params)
        format.html { redirect_to @player_worm_set, notice: 'Player worm set was successfully updated.' }
        format.json { render :show, status: :ok, location: @player_worm_set }
      else
        format.html { render :edit }
        format.json { render json: @player_worm_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /player_worm_sets/1
  # DELETE /player_worm_sets/1.json
  def destroy
    @player_worm_set.destroy
    respond_to do |format|
      format.html { redirect_to player_worm_sets_url, notice: 'Player worm set was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player_worm_set
      @player_worm_set = PlayerWormSet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_worm_set_params
      params.require(:player_worm_set).permit(:player_id, :game_id)
    end
end
