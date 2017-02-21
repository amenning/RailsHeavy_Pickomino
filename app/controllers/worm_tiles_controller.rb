class WormTilesController < ApplicationController
  before_action :set_worm_tile, only: [:show, :edit, :update, :destroy]

  # GET /worm_tiles
  # GET /worm_tiles.json
  def index
    @worm_tiles = WormTile.all
  end

  # GET /worm_tiles/1
  # GET /worm_tiles/1.json
  def show
  end

  # GET /worm_tiles/new
  def new
    @worm_tile = WormTile.new
  end

  # GET /worm_tiles/1/edit
  def edit
  end

  # POST /worm_tiles
  # POST /worm_tiles.json
  def create
    @worm_tile = WormTile.new(worm_tile_params)

    respond_to do |format|
      if @worm_tile.save
        format.html { redirect_to @worm_tile, notice: 'Worm tile was successfully created.' }
        format.json { render :show, status: :created, location: @worm_tile }
      else
        format.html { render :new }
        format.json { render json: @worm_tile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /worm_tiles/1
  # PATCH/PUT /worm_tiles/1.json
  def update
    respond_to do |format|
      if @worm_tile.update(worm_tile_params)
        format.html { redirect_to @worm_tile, notice: 'Worm tile was successfully updated.' }
        format.json { render :show, status: :ok, location: @worm_tile }
      else
        format.html { render :edit }
        format.json { render json: @worm_tile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /worm_tiles/1
  # DELETE /worm_tiles/1.json
  def destroy
    @worm_tile.destroy
    respond_to do |format|
      format.html { redirect_to worm_tiles_url, notice: 'Worm tile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worm_tile
      @worm_tile = WormTile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def worm_tile_params
      params.require(:worm_tile).permit(:value, :worm_count, :image_id)
    end
end
