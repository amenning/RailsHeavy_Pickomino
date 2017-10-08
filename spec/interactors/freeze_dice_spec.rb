require 'rails_helper'
RSpec.describe FreezeDice, type: :Interactor do
  fixtures :frozen_dice_sets, :frozen_dices, :active_dice_sets, :active_dices, :dices

  context 'when given valid frozen_dice_set, and dice_value in last active_dice_set' do
    it 'should return success' do
      create_active_dice_for_game
      context = FreezeDice.call(
        game: @game,
        dice_value: 3,
        frozen_dice_set: FrozenDiceSet.find(3)
      )
      expect(context).to be_a_success
    end
  end

  def create_active_dice_for_game
    user = FactoryGirl.build(:user)
    player = Player.create(user: user)
    @game = Game.create(player: player)
    ActiveDiceSet.create(game: @game)
  end
end
