class PlayerOptionsController < ApplicationController
  before_action :set_player_option, only: [:show, :edit, :update, :destroy]

  # GET /player_options
  # GET /player_options.json
  def index
    @player_options = PlayerOption.all
  end

  # GET /player_options/1
  # GET /player_options/1.json
  def show
  end

  # GET /player_options/new
  def new
    @player_option = PlayerOption.new
  end

  # GET /player_options/1/edit
  def edit
  end

  # POST /player_options
  # POST /player_options.json
  def create
    @player_option = PlayerOption.new(player_option_params)

    respond_to do |format|
      if @player_option.save
        format.html { redirect_to @player_option, notice: 'Player option was successfully created.' }
        format.json { render :show, status: :created, location: @player_option }
      else
        format.html { render :new }
        format.json { render json: @player_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /player_options/1
  # PATCH/PUT /player_options/1.json
  def update
    respond_to do |format|
      if @player_option.update(player_option_params)
        format.html { redirect_to @player_option, notice: 'Player option was successfully updated.' }
        format.json { render :show, status: :ok, location: @player_option }
      else
        format.html { render :edit }
        format.json { render json: @player_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /player_options/1
  # DELETE /player_options/1.json
  def destroy
    @player_option.destroy
    respond_to do |format|
      format.html { redirect_to player_options_url, notice: 'Player option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player_option
      @player_option = PlayerOption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_option_params
      params.require(:player_option).permit(:game_state_id, :can_roll)
    end
end
