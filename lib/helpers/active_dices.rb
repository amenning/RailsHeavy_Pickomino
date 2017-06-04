module Helpers
  class ActiveDices
    def new_active_dice_hash(is_new_game = false)
      @is_new_game = is_new_game
      @active_dice_set = new_active_dice_set
      check_if_active_dice_can_be_frozen unless @is_new_game
      create_active_dice_hash
    end

    def active_dice_hash_after_freeze
      @active_dice_set = ActiveDiceSet.last
      check_if_active_dice_can_be_frozen
      create_active_dice_hash
    end

    private

    def new_active_dice_set
      result = @is_new_game ? call_setup_board_interactor : call_roll_interactor
      result.active_dice_set
    end

    def call_setup_board_interactor
      number_of_active_dice = Rails.configuration.x.game_parameters['total_dice']
      FrozenDiceSet.create
      SetupActiveDice.call(
        active_dice_set: ActiveDiceSet.create,
        number_of_active_dice: number_of_active_dice
      )
    end

    def call_roll_interactor
      number_of_active_dice = ActiveDiceSet.last.active_dice.count
      Roll.call(
        active_dice_set: ActiveDiceSet.create,
        number_of_active_dice: number_of_active_dice
      )
    end

    def check_if_active_dice_can_be_frozen
      frozen_dice_values = FrozenDiceSet.last.all_raw_frozen_dice_values
      ActiveDiceSet.last.active_dice.map do |active_dice|
        already_frozen = frozen_dice_values.include? active_dice.dice.last.value
        active_dice.can_freeze = !already_frozen
        active_dice.save
      end
    end

    def create_active_dice_hash
      return {} if @active_dice_set.active_dice.all.nil?
      active_dice_hash = ActiveDiceSet.select(:value, :can_freeze)
        .joins(active_dice: :dice)
        .where('id' => @active_dice_set.id).map do |dice|
          {
            value: dice.value,
            image: images_helper.get_dice_image(dice.value),
            canFreeze: dice.can_freeze
          }
        end
      active_dice_hash.compact
    end

    def images_helper
      @images_helper ||= Helpers::Images.new
    end
  end
end
