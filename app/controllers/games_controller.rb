class GamesController < ApplicationController
  def first_roll
    number_of_active_dice = Rails.configuration.x.game_parameters['total_dice']
    result = Roll.call(
      active_dice_set: ActiveDiceSet.create,
      number_of_active_dice: number_of_active_dice
    )
    dice_values = GamesHelper.get_active_dice_values(result.active_dice_set)
    @active_dice = GamesHelper.get_active_dice_values_with_images_hash(dice_values)
    respond_to do |format|
      format.html { render :active_dice }
      format.js { render :active_dice }
    end
  end

  def roll
    number_of_active_dice = ActiveDiceSet.last.active_dice.count
    result = Roll.call(
      active_dice_set: ActiveDiceSet.create,
      number_of_active_dice: number_of_active_dice
    )
    dice_values = GamesHelper.get_active_dice_values(result.active_dice_set)
    @active_dice = GamesHelper.get_active_dice_values_with_images_hash(dice_values)
    respond_to do |format|
      format.js { render 'active_dice' }
    end
  end
end
