class GrillWormTilesController < ApplicationController
  before_action :set_grill_worm_tile, only: [:show, :edit, :update, :destroy]

  # GET /grill_worm_tiles
  # GET /grill_worm_tiles.json
  def index
    @grill_worm_tiles = GrillWormTile.all
  end

  # GET /grill_worm_tiles/1
  # GET /grill_worm_tiles/1.json
  def show
  end

  # GET /grill_worm_tiles/new
  def new
    @grill_worm_tile = GrillWormTile.new
  end

  # GET /grill_worm_tiles/1/edit
  def edit
  end

  # POST /grill_worm_tiles
  # POST /grill_worm_tiles.json
  def create
    @grill_worm_tile = GrillWormTile.new(grill_worm_tile_params)

    respond_to do |format|
      if @grill_worm_tile.save
        format.html { redirect_to @grill_worm_tile, notice: 'Grill worm tile was successfully created.' }
        format.json { render :show, status: :created, location: @grill_worm_tile }
      else
        format.html { render :new }
        format.json { render json: @grill_worm_tile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grill_worm_tiles/1
  # PATCH/PUT /grill_worm_tiles/1.json
  def update
    respond_to do |format|
      if @grill_worm_tile.update(grill_worm_tile_params)
        format.html { redirect_to @grill_worm_tile, notice: 'Grill worm tile was successfully updated.' }
        format.json { render :show, status: :ok, location: @grill_worm_tile }
      else
        format.html { render :edit }
        format.json { render json: @grill_worm_tile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grill_worm_tiles/1
  # DELETE /grill_worm_tiles/1.json
  def destroy
    @grill_worm_tile.destroy
    respond_to do |format|
      format.html { redirect_to grill_worm_tiles_url, notice: 'Grill worm tile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grill_worm_tile
      @grill_worm_tile = GrillWormTile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grill_worm_tile_params
      params.require(:grill_worm_tile).permit(:grill_id, :worm_id, :can_take, :is_dead)
    end
end
