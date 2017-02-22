class PlayerWormsController < ApplicationController
  before_action :set_player_worm, only: [:show, :edit, :update, :destroy]

  # GET /player_worms
  # GET /player_worms.json
  def index
    @player_worms = PlayerWorm.all
  end

  # GET /player_worms/1
  # GET /player_worms/1.json
  def show
  end

  # GET /player_worms/new
  def new
    @player_worm = PlayerWorm.new
  end

  # GET /player_worms/1/edit
  def edit
  end

  # POST /player_worms
  # POST /player_worms.json
  def create
    @player_worm = PlayerWorm.new(player_worm_params)

    respond_to do |format|
      if @player_worm.save
        format.html { redirect_to @player_worm, notice: 'Player worm was successfully created.' }
        format.json { render :show, status: :created, location: @player_worm }
      else
        format.html { render :new }
        format.json { render json: @player_worm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /player_worms/1
  # PATCH/PUT /player_worms/1.json
  def update
    respond_to do |format|
      if @player_worm.update(player_worm_params)
        format.html { redirect_to @player_worm, notice: 'Player worm was successfully updated.' }
        format.json { render :show, status: :ok, location: @player_worm }
      else
        format.html { render :edit }
        format.json { render json: @player_worm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /player_worms/1
  # DELETE /player_worms/1.json
  def destroy
    @player_worm.destroy
    respond_to do |format|
      format.html { redirect_to player_worms_url, notice: 'Player worm was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player_worm
      @player_worm = PlayerWorm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_worm_params
      params.require(:player_worm).permit(:player_id, :game_state_id, :worm_id)
    end
end
