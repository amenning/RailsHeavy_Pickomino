require 'rails_helper'
RSpec.describe Helpers::FrozenDices, type: :Helper do
  fixtures :active_dice_sets, :active_dices, :frozen_dice_sets, :frozen_dices, :dices

  before(:each) do
    @frozen_dices_helper = Helpers::FrozenDices.new
    create(:frozen_dice_status)
    inject_mock_images_helper
  end

  context 'when frozen_dice_hash_after_freeze is called' do
    it 'should return an array of hashes' do
      create_dice_for_game
      frozen_dice_hash = @frozen_dices_helper.frozen_dice_hash_after_freeze(@game, 3)
      expect(frozen_dice_hash).to be_a(Array)
      expect(frozen_dice_hash[0]).to be_a(Hash)
    end

    it 'should find the correct frozen dice' do
      create_dice_for_game
      frozen_dice_hash = @frozen_dices_helper.frozen_dice_hash_after_freeze(@game, 3)
      expect(frozen_dice_hash).to eq([{ value: 3, image: 'dice_image.png' }])
    end
  end

  context 'when frozen_dice_sum is called' do
    it 'should return an integer' do
      @game = FactoryGirl.create(:frozen_dice_status).game
      frozen_dice_sum = @frozen_dices_helper.frozen_dice_sum(@game, [1, 2, 3])
      expect(frozen_dice_sum).to be_a(Integer)
      expect(frozen_dice_sum).to eq(6)
    end
  end

  private

  def inject_mock_images_helper
    mock_images_helper = double(
      'Helpers::Images',
      get_dice_image: 'dice_image.png'
    )
    @frozen_dices_helper.images_helper = mock_images_helper
  end

  def create_dice_for_game
    dice = FactoryGirl.create(:dice)
    @game = dice.active_dice.active_dice_set.game
    FactoryGirl.create(:frozen_dice_set, game: @game)
  end
end
