require 'rails_helper'

RSpec.describe SumPlayerWorms, type: :Interactor do
  before(:each) do
    @mock_player_worm_array = mock_player_worm_array
  end

  context 'when given valid player_worm_array' do
    it 'should return a success' do
      result = call_sum_player_worm_interactor
      expect(result).to be_a_success
    end

    it 'should correctly sum dice values as given' do
      result = call_sum_player_worm_interactor
      expect(result.player_worm_count).to eq(expected_count)
    end
  end

  private

  def call_sum_player_worm_interactor
    SumPlayerWorms.call(player_worm_values: @mock_player_worm_array)
  end

  def mock_player_worm_array
    player_worm_array = []
    example_range.each do |worm_count|
      player_worm_array.push(worm_count)
    end
    player_worm_array
  end

  def example_range
    (1..6)
  end

  def expected_count
    example_range.reduce(:+)
  end
end
