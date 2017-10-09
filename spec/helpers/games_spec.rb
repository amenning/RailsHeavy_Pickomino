require 'rails_helper'
RSpec.describe Helpers::Games, type: :Helper do
  context 'when called, it should direct to the correct helper' do
    before(:each) do
      @games_helper = Helpers::Games.new
    end

    it 'should call the Helper::Grills to get grill_worms_hash' do
      mock_grills_helper = double(
        'Helpers::Grills',
        grill_worms_hash: { test: [1, 2, 3] }
      )
      @games_helper.grills_helper = mock_grills_helper
      result = @games_helper.grill_worms_hash(true)
      expect(result).to eq(test: [1, 2, 3])
    end

    it 'should call the Helper::ActiveDices to get new_active_dice_hash' do
      mock_active_dices_helper = double(
        'Helpers::ActiveDices',
        new_active_dice_hash: { test: [1, 2, 3] }
      )
      @games_helper.active_dices_helper = mock_active_dices_helper
      result = @games_helper.new_active_dice_hash(true)
      expect(result).to eq(test: [1, 2, 3])
    end

    it 'should call the Helper::ActiveDices to get active_dice_after_freeze' do
      mock_game = double('Game')
      mock_active_dices_helper = double(
        'Helpers::ActiveDices',
        active_dice_hash_after_freeze: { test: [1, 2, 3] }
      )
      @games_helper.active_dices_helper = mock_active_dices_helper
      result = @games_helper.active_dice_hash_after_freeze(mock_game)
      expect(result).to eq(test: [1, 2, 3])
    end

    it 'should call the Helper::FrozenDices to get frozen_dice_after_freeze' do
      mock_game = double('Game')
      mock_frozen_dices_helper = double(
        'Helpers::FrozenDices',
        frozen_dice_hash_after_freeze: { test: [1, 2, 3] }
      )
      @games_helper.frozen_dices_helper = mock_frozen_dices_helper
      result = @games_helper.frozen_dice_hash_after_freeze(mock_game, dice_value: 1)
      expect(result).to eq(test: [1, 2, 3])
    end

    it 'should call the Helper::FrozenDices to get frozen_dice_sum' do
      mock_frozen_dices_helper = double(
        'Helpers::FrozenDices',
        frozen_dice_sum: 21
      )
      @games_helper.frozen_dices_helper = mock_frozen_dices_helper
      result = @games_helper.frozen_dice_sum(dice_value: [10, 11])
      expect(result).to eq(21)
    end

    it 'should call the Helper::PlayerWorms to get player_worms_hash_after_claim' do
      mock_game = double('Game')
      mock_player_worms_helper = double(
        'Helpers::PlayerWorms',
        player_worms_hash_after_claim: { test: [1, 2, 3] }
      )
      @games_helper.player_worms_helper = mock_player_worms_helper
      result = @games_helper.player_worms_hash_after_claim(mock_game, worm_value: 1)
      expect(result).to eq(test: [1, 2, 3])
    end

    it 'should call the Helper::PlayerWorms to sum_player_worms' do
      mock_player_worms_helper = double(
        'Helpers::PlayerWorms',
        sum_player_worms: 21
      )
      @games_helper.player_worms_helper = mock_player_worms_helper
      result = @games_helper.sum_player_worms([10, 11])
      expect(result).to eq(21)
    end
  end
end
