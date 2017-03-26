require 'rails_helper'
RSpec.describe Helpers::GamesHelper, type: :Helper do
  context 'when called, it should direct to the correct helper' do
    it 'should call the GrillsHelper to get grill worm hash' do
      sum = Helpers::GamesHelper.frozen_dice_sum([1, 2, 3])
      expect(sum).to equal(6)
    end
  end
end
