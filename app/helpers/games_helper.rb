module GamesHelper
  def self.get_active_dice_values(dice_set)
    dice_set.active_dice.map { |active_die| active_die.dice.last.value }
  end

  def self.get_active_dice_values_with_images_hash(dice_array)
    theme = Theme.find(1)
    dice_array.map do |value|
      dice_image = theme.image.where('target LIKE ?', '%' + value.to_s + ' pip die face%').take
      { value: value, image: dice_image.filename + '.' + dice_image.filetype }
    end
  end
end
