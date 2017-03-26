module Helpers
  class Images
    attr_writer :themes_helper

    def initialize
      @themes_helper = Helpers::Themes.new
    end

    def get_dice_image(dice_value)
      dice_image = @themes_helper.theme.image.where(
        'target LIKE ?', '%' + dice_value.to_s + ' pip die face%'
      ).take
      get_filename_with_filetype(dice_image)
    end

    def get_worm_tile_image(worm_count)
      worm_image = @themes_helper.theme.image.where(
        'target LIKE ?', '%' + worm_count.to_s + ' worm tile%'
      ).take
      get_filename_with_filetype(worm_image)
    end

    private

    def get_filename_with_filetype(image)
      image.filename + '.' + image.filetype
    end
  end
end
