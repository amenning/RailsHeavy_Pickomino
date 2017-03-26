require 'rails_helper'
RSpec.describe Helpers::FrozenDices, type: :Helper do
  fixtures :active_dice_sets, :active_dices, :frozen_dice_sets, :frozen_dices, :dices

  context 'when called, it should return an image' do
    before(:each) do
      @frozen_dices_helper = Helpers::FrozenDices.new
      mock_images_helper = double(
        'Helpers::Images',
        get_dice_image: 'dice_image.png'
      )
      @frozen_dices_helper.images_helper = mock_images_helper
    end

    it 'should return a array of hashes for frozen_dice_hash_after_freeze' do
      frozen_dice_hash = @frozen_dices_helper.frozen_dice_hash_after_freeze(3)
      expect(frozen_dice_hash).to be_a(Array)
      expect(frozen_dice_hash[0]).to be_a(Hash)
    end

    it 'should find the correct frozen dice' do
      frozen_dice_hash = @frozen_dices_helper.frozen_dice_hash_after_freeze(3)
      expect(frozen_dice_hash).to eq([{ value: 3, image: 'dice_image.png' }])
    end
  end
end
