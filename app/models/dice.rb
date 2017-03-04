class Dice < ActiveRecord::Base
  belongs_to :active_dice
  belongs_to :frozen_dice

  def create_random_dice
    game_parameters = Rails.configuration.x.game_parameters
    self.value = rand(game_parameters['min_dice_value']..game_parameters['max_dice_value'])
    save
  end
end
