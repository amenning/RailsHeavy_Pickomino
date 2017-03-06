require 'rails_helper'

RSpec.describe Roll, type: :Interactor do
  context 'when given valid active_dice_set, active_dice, and dice objects' do
    it 'should successfully create a filled dice set' do
      active_dice_set = double('ActiveDiceSet', id: 3, save: true)
      active_dice_objects = []
      dice_objects = []
      8.times do
        mock_active_dice = double('ActiveDice', new: true, save: true, id: 4)
        expect(mock_active_dice).to receive(:active_dice_set_id=).with(3)
        active_dice_objects.push(mock_active_dice)
        mock_dice = double('Dice', new: true, save: true, create_random_dice: true, value: 5)
        expect(mock_dice).to receive(:active_dice_id=).with(4)
        dice_objects.push(mock_dice)
      end
      context = Roll.call(active_dice_set: active_dice_set, active_dice_objects: active_dice_objects, dice_objects: dice_objects)
      expect(context).to be_a_success
      expect(context.active_dice_set.id).to eq(3)
    end
  end
end
