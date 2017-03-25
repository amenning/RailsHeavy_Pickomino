require 'rails_helper'

RSpec.describe SumFrozenDice, type: :Interactor do
  before(:each) do
    @mock_dice_set_array = mock_dice_set_array
  end

  context 'when given valid frozen_dice_set' do
    it 'should return a success' do
      result = call_sum_frozen_dice_interactor
      expect(result).to be_a_success
    end

    it 'should correctly sum dice values as given' do
      result = call_sum_frozen_dice_interactor
      expect(result.frozen_dice_sum).to eq(expected_sum)
    end
  end

  private

  def call_sum_frozen_dice_interactor
    SumFrozenDice.call(frozen_dice_values: @mock_dice_set_array)
  end

  def mock_dice_set_array
    dice_set_array = []
    example_range.each do |value|
      dice_set_array.push(value)
    end
    dice_set_array
  end

  def example_range
    (1..6)
  end

  def expected_sum
    example_range.reduce(:+)
  end
end
