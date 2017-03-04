require 'rails_helper'

RSpec.describe Dice, type: :model do
  it 'should create dice with random value with range of 1 to 6' do
    100.times do
      @dice = Dice.new
      @dice.create_random_dice
      expect(1..6).to cover(@dice.value)
    end
  end
end
