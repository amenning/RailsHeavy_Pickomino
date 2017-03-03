class Dice < ActiveRecord::Base
  belongs_to :active_dice
  belongs_to :frozen_dice

  def createRandomDice
    self.value = rand(1..6)
    save
  end
end
