class GameStatesController < ApplicationController
  before_action :set_game_state, only: [:show, :edit, :update, :destroy]

  # GET /game_states
  # GET /game_states.json
  def index
    @game_states = GameState.all
  end

  # GET /game_states/1
  # GET /game_states/1.json
  def show
  end

  # GET /game_states/new
  def new
    @game_state = GameState.new
  end

  # GET /game_states/1/edit
  def edit
  end

  # POST /game_states
  # POST /game_states.json
  def create
    @game_state = GameState.new(game_state_params)

    respond_to do |format|
      if @game_state.save
        format.html { redirect_to @game_state, notice: 'Game state was successfully created.' }
        format.json { render :show, status: :created, location: @game_state }
      else
        format.html { render :new }
        format.json { render json: @game_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_states/1
  # PATCH/PUT /game_states/1.json
  def update
    respond_to do |format|
      if @game_state.update(game_state_params)
        format.html { redirect_to @game_state, notice: 'Game state was successfully updated.' }
        format.json { render :show, status: :ok, location: @game_state }
      else
        format.html { render :edit }
        format.json { render json: @game_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_states/1
  # DELETE /game_states/1.json
  def destroy
    @game_state.destroy
    respond_to do |format|
      format.html { redirect_to game_states_url, notice: 'Game state was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_state
      @game_state = GameState.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_state_params
      params.require(:game_state).permit(:game_id)
    end
end
