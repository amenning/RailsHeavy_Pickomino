class GamesController < ApplicationController
  def play
    @active_dice = GamesHelper.get_active_dice_hash(true)
    respond_to do |format|
      format.html { render :game_board }
    end
  end

  def roll
    @active_dice = GamesHelper.get_active_dice_hash
    respond_to do |format|
      format.js { render 'roll' }
    end
  end
end
