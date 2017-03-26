module Helpers
  class BaseHelper
    attr_writer :grills_helper, :active_dices_helper, :frozen_dices_helper, :player_worms_helper

    def initialize
      @grills_helper = Helpers::Grills.new
      @active_dices_helper =  Helpers::ActiveDices.new
      @frozen_dices_helper =  Helpers::FrozenDices.new
      @player_worms_helper =  Helpers::PlayerWorms.new
    end
  end
end
