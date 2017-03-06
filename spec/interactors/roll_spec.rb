require 'rails_helper'

RSpec.describe Roll, type: :Interactor do
  context 'when given valid active_dice_set, active_dice, and dice objects' do
    it 'should successfully create a filled dice set' do
      active_dice_set = double('ActiveDiceSet', id: 3, save: true)
      active_dice = []
      dice = []
      8.times do
        active_dice.push(double('ActiveDice', new: true, save: true, id: 4, 'active_dice_set_id=': true))
        dice.push(double('Dice', new: true, save: true, create_random_dice: 3, 'active_dice_id=': true, value: 5))
      end
      context = Roll.call(active_dice_set: active_dice_set, active_dice: active_dice, dice: dice)
      expect(context).to be_a_success
      expect(context.active_dice_set.id).to eq(3)
    end
  end
end
