require 'rails_helper'
RSpec.describe Helpers::PlayerOptions, type: :Helper do
  context 'when called, it should return an image' do
    before(:each) do
      @player_options_helper = Helpers::PlayerOptions.new
    end

    context 'when player_options_hash is called' do
      it 'should return can_roll true for new game' do
        player_option_hash = @player_options_helper.player_options_hash(true)
        expect(player_option_hash).to be_a(Hash)
        expect(player_option_hash[:canRoll]).to equal(true)
      end
    end
  end
end
