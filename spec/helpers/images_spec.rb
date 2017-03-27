require 'rails_helper'
RSpec.describe Helpers::Images, type: :Helper do
  context 'when called, it should return an image' do
    before(:each) do
      @images_helper = Helpers::Images.new
      @theme = create(:theme, id: 1)
    end

    it 'should return a string for dice image' do
      create_target_dice_image
      image = @images_helper.get_dice_image(3)
      expect(image).to be_a(String)
    end

    it 'should return a string for worm tile image' do
      create_target_worm_tile_image
      image = @images_helper.get_worm_tile_image(2)
      expect(image).to be_a(String)
    end

    private

    def create_target_dice_image
      create(
        :image,
        target: '3 pip die face',
        theme: @theme
      )
    end

    def create_target_worm_tile_image
      create(
        :image,
        target: '2 worm tile',
        theme: @theme
      )
    end
  end
end
