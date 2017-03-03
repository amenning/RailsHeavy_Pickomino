require 'test_helper'

class DiceTest < ActiveSupport::TestCase
  test 'should create dice with random value with range of 1 to 6' do
    @dice = Dice.new
    @dice.createRandomDice

    assert_not_nil @dice.value
    expect(@dice.value).to be <= 6
    expect(@dice.value).to be >= 1
  end
end
