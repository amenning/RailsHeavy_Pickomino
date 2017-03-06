require 'rails_helper'

RSpec.describe Roll, type: :Interactor do
  context 'when given valid dice_set' do
    before do
      allow_any_instance_of(ActiveDiceSet).to receive(:id).and_return(2)
    end

    it 'should do something' do
      context = Roll.call(number_of_active_dice: 8)
      expect(context).to be_a_success
      expect(context.dice_set.id).to eq(2)
    end
  end
end
