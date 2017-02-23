class PlayerStatusesController < ApplicationController
  before_action :set_player_status, only: [:show, :edit, :update, :destroy]

  # GET /player_statuses
  # GET /player_statuses.json
  def index
    @player_statuses = PlayerStatus.all
  end

  # GET /player_statuses/1
  # GET /player_statuses/1.json
  def show
  end

  # GET /player_statuses/new
  def new
    @player_status = PlayerStatus.new
  end

  # GET /player_statuses/1/edit
  def edit
  end

  # POST /player_statuses
  # POST /player_statuses.json
  def create
    @player_status = PlayerStatus.new(player_status_params)

    respond_to do |format|
      if @player_status.save
        format.html { redirect_to @player_status, notice: 'Player status was successfully created.' }
        format.json { render :show, status: :created, location: @player_status }
      else
        format.html { render :new }
        format.json { render json: @player_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /player_statuses/1
  # PATCH/PUT /player_statuses/1.json
  def update
    respond_to do |format|
      if @player_status.update(player_status_params)
        format.html { redirect_to @player_status, notice: 'Player status was successfully updated.' }
        format.json { render :show, status: :ok, location: @player_status }
      else
        format.html { render :edit }
        format.json { render json: @player_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /player_statuses/1
  # DELETE /player_statuses/1.json
  def destroy
    @player_status.destroy
    respond_to do |format|
      format.html { redirect_to player_statuses_url, notice: 'Player status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player_status
      @player_status = PlayerStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_status_params
      params.require(:player_status).permit(:game_id, :player_id, :score)
    end
end
