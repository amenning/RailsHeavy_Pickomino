class GamesController < ApplicationController
  def first_roll
    @active_dice = GamesHelper.get_active_dice_hash(true)
    respond_to do |format|
      format.html { render :active_dice }
    end
  end

  def roll
    @active_dice = GamesHelper.get_active_dice_hash
    respond_to do |format|
      format.js { render 'active_dice' }
    end
  end
end
