module Helpers
  class Images
    def get_dice_image(dice_value)
      @theme ||= themes_helper.theme
      dice_image = @theme.image.where(
        'target LIKE ?', '%' + dice_value.to_s + ' pip die face%'
      ).take
      get_filename_with_filetype(dice_image)
    end

    def get_worm_tile_image(worm_count)
      @theme ||= themes_helper.theme
      worm_image = @theme.image.where(
        'target LIKE ?', '%' + worm_count.to_s + ' worm tile%'
      ).take
      get_filename_with_filetype(worm_image)
    end

    private

    def get_filename_with_filetype(image)
      image.filename + '.' + image.filetype
    end

    def themes_helper
      @themes_helper ||= Helpers::Themes.new
    end
  end
end
