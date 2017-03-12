module GamesHelper
  def self.get_grill_worms_hash(is_new_game = false)
    @is_new_game = is_new_game
    @grill = get_new_grill
    create_grill_worm_hash
  end

  def self.get_new_active_dice_hash(is_new_game = false)
    @is_new_game = is_new_game
    @active_dice_set = get_new_active_dice_set
    create_active_dice_hash
  end

  def self.get_active_dice_hash_after_freeze
    @active_dice_set = ActiveDiceSet.last
    create_active_dice_hash
  end

  def self.get_frozen_dice_hash_after_freeze(dice_value)
    @dice_value = dice_value
    @active_dice_set = ActiveDiceSet.last
    @frozen_dice_set = FrozenDiceSet.last
    if verify_active_dice_set_has_value && verify_frozen_dice_set_does_not_have_value
      move_dice_from_active_to_frozen
    end
    create_frozen_dice_hash
  end

  def self.verify_active_dice_set_has_value
    0 < @active_dice_set.active_dice.all.to_a.reduce(0) do |count, active_dice|
      count + (active_dice.dice.last.value == @dice_value ? 1 : 0)
    end
  end

  def self.verify_frozen_dice_set_does_not_have_value
    0 === @frozen_dice_set.frozen_dice.all.to_a.reduce(0) do |count, frozen_dice|
      unless frozen_dice.dice.last.nil?
        count + (frozen_dice.dice.last.value == @dice_value ? 1 : 0)
      end
    end
  end

  def self.move_dice_from_active_to_frozen
    @active_dice_set.active_dice.all.to_a.map do |active_dice|
      dice = active_dice.dice.last
      next unless dice.value == @dice_value
      dice.active_dice_id = nil
      frozen_dice = @frozen_dice_set.frozen_dice.create
      dice.frozen_dice_id = frozen_dice.id
      dice.save
      active_dice.destroy
    end
  end

  def self.create_frozen_dice_hash
    theme = Theme.find(1)
    unless @frozen_dice_set.frozen_dice.nil?
      frozen_dice_hash = @frozen_dice_set.frozen_dice.map do |frozen_dice|
        next if frozen_dice.dice.last.nil?
        value = frozen_dice.dice.last.value
        dice_image = theme.image.where('target LIKE ?', '%' + value.to_s + ' pip die face%').take
        {
          value: value,
          image: dice_image.filename + '.' + dice_image.filetype
        }
      end
      frozen_dice_hash.compact
    end
  end

  private

  def self.get_new_grill
    result = call_setup_grill_interactor if @is_new_game
    result.grill
  end

  def self.call_setup_grill_interactor
    SetupGrill.call(
      min_worm_tile: Rails.configuration.x.game_parameters['min_worm_tile'],
      max_worm_tile: Rails.configuration.x.game_parameters['max_worm_tile'],
      min_worm_count: Rails.configuration.x.game_parameters['min_worm_count'],
      worm_count_increment: Rails.configuration.x.game_parameters['worm_count_increment'],
      grill: Grill.create
    )
  end

  def self.create_grill_worm_hash
    theme = Theme.find(1)
    grill_worm_hash = @grill.grill_worm.all.to_a.map do |grill_worm|
      worm_count = grill_worm.worm.last.worm_count
      worm_image = theme.image.where('target LIKE ?', '%' + worm_count.to_s + ' worm tile%').take
      {
        value: grill_worm.worm.last.value,
        image: worm_image.filename + '.' + worm_image.filetype,
        canTake: grill_worm['can_take'] == 1 ? true : false,
        isDead: grill_worm['is_dead'] == 1 ? true : false
      }
    end
    grill_worm_hash.compact
  end

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
    theme = Theme.find(1)
    unless @active_dice_set.active_dice.nil?
      active_dice_hash = @active_dice_set.active_dice.map do |active_dice|
        next if active_dice.dice.last.nil?
        value = active_dice.dice.last.value
        dice_image = theme.image.where('target LIKE ?', '%' + value.to_s + ' pip die face%').take
        {
          value: value,
          image: dice_image.filename + '.' + dice_image.filetype,
          canFreeze: active_dice['can_freeze']
        }
      end
      active_dice_hash.compact
    end
  end
end
