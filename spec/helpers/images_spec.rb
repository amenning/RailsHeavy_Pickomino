require 'rails_helper'
RSpec.describe Helpers::Images, type: :Helper do
  fixtures :themes, :images

  context 'when called, it should return an image' do
    before(:each) do
      @images_helper = Helpers::Images.new
    end

    it 'should return a string for dice image' do
      image = @images_helper.get_dice_image(3)
      expect(image).to be_a(String)
    end

    it 'should return a string for worm tile image' do
      image = @images_helper.get_worm_tile_image(2)
      expect(image).to be_a(String)
    end
  end
end
