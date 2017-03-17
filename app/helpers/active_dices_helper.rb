module ActiveDicesHelper
  def self.get_new_active_dice_hash(is_new_game = false)
    @is_new_game = is_new_game
    @active_dice_set = get_new_active_dice_set
    create_active_dice_hash
  end

  def self.get_active_dice_hash_after_freeze
    @active_dice_set = ActiveDiceSet.last
    create_active_dice_hash
  end

  private

  def self.get_new_active_dice_set
    result = @is_new_game ? call_setup_board_interactor : call_roll_interactor
    result.active_dice_set
  end

  def self.call_setup_board_interactor
    number_of_active_dice = Rails.configuration.x.game_parameters['total_dice']
    FrozenDiceSet.create
    SetupActiveDice.call(
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
    unless @active_dice_set.active_dice.nil?
      ActiveRecord::Base.transaction do
        active_dice_hash = ActiveDiceSet.select(:value, :can_freeze)
          .joins(active_dice: :dice)
          .where('id' => @active_dice_set.id).map do |dice|
            {
              value: dice.value,
              image: ImagesHelper.get_dice_image(dice.value),
              canFreeze: dice.can_freeze
            }
          end
        active_dice_hash.compact
      end
    end
  end
end
