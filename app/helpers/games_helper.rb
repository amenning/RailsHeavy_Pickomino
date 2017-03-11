module GamesHelper
  def self.get_active_dice_hash(is_new_game = false)
    @is_new_game = is_new_game
    @active_dice_set = get_new_active_dice_set
    create_active_dice_hash
  end

  private

  def self.get_new_active_dice_set
    result = @is_new_game ? call_setup_board_interactor : call_roll_interactor
    result.active_dice_set
  end

  def self.call_setup_board_interactor
    number_of_active_dice = Rails.configuration.x.game_parameters['total_dice']
    SetupBoard.call(
      active_dice_set: ActiveDiceSet.create,
      number_of_active_dice: number_of_active_dice
    )
  end

  def self.call_roll_interactor
    number_of_active_dice = ActiveDiceSet.last.active_dice.count
    Roll.call(
      active_dice_set: ActiveDiceSet.create,
      number_of_active_dice: number_of_active_dice
    )
  end

  def self.create_active_dice_hash
    theme = Theme.find(1)
    @active_dice_set.active_dice.map do |active_dice|
      value = active_dice.dice.last.value
      dice_image = theme.image.where('target LIKE ?', '%' + value.to_s + ' pip die face%').take
      {
        value: value,
        image: dice_image.filename + '.' + dice_image.filetype,
        canFreeze: active_dice['can_freeze']
      }
    end
  end
end
