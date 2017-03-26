require 'rails_helper'

RSpec.describe Roll, type: :Interactor do
  context 'when given valid active_dice_set, active_dice, and dice objects' do
    it 'should successfully create a filled dice set' do
      context = Roll.call(
        active_dice_set: mock_active_dice_set,
        number_of_active_dice: 8
      )
      expect(context).to be_a_success
      expect(context.active_dice_set.id).to eq(3)
    end
  end

  private

  def mock_active_dice_set
    double('ActiveDiceSet', id: 3, active_dice: mock_active_dice)
  end

  def mock_active_dice
    double('ActiveDice', create: mock_active_dice_create)
  end

  def mock_active_dice_create
    double('ActiveDice', id: 4, dice: mock_dice)
  end

  def mock_dice
    double('Dice', build: mock_dice_build)
  end

  def mock_dice_build
    double('Dice', id: 5, create_random_dice: true)
  end
end
