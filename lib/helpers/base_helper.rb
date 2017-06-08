module Helpers
  class BaseHelper
    attr_writer :grills_helper
    attr_writer :active_dices_helper
    attr_writer :frozen_dices_helper
    attr_writer :player_worms_helper
    attr_writer :themes_helper
    attr_writer :images_helper

    def initialize
      @grills_helper = Helpers::Grills.new
      @player_options_helper = Helpers::PlayerOptions.new
      @active_dices_helper =  Helpers::ActiveDices.new
      @frozen_dices_helper =  Helpers::FrozenDices.new
      @player_worms_helper =  Helpers::PlayerWorms.new
      @themes_helper = Helpers::Themes.new
      @images_helper = Helpers::Images.new
    end
  end
end
