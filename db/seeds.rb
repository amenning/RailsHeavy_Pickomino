# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Themes
theme = Theme.create(name: 'Original')

# Images
Image.create(target: 'frontend-logo', filename: 'AngularJS-Shield-large', filetype: 'png', description: 'Angular JS logo', theme_id: theme.id)
Image.create(target: 'database-logo', filename: 'Postgresql-logo', filetype: 'png', description: 'Postgresql logo', theme_id:  theme.id)
Image.create(target: 'backend-logo', filename: 'Ruby_on_Rails-logo', filetype: 'png', description: 'RoR logo', theme_id:  theme.id)
Image.create(target: 'background', filename: 'BackgroundImage', filetype: 'png', description: 'Sky', theme_id:  theme.id)
Image.create(target: 'title screen', filename: 'PickominoBoxCoverImage', filetype: 'png', description: 'title screen image', theme_id:  theme.id)

Image.create(target: '1 pip die face', filename: 'DiceFaceOne', filetype: 'png', description: '1 pips', theme_id:  theme.id)
Image.create(target: '2 pip die face', filename: 'DiceFaceTwo', filetype: 'png', description: '2 pips', theme_id:  theme.id)
Image.create(target: '3 pip die face', filename: 'DiceFaceThree', filetype: 'png', description: '3 pips', theme_id:  theme.id)
Image.create(target: '4 pip die face', filename: 'DiceFaceFour', filetype: 'png', description: '4 pips', theme_id:  theme.id)
Image.create(target: '5 pip die face', filename: 'DiceFaceFive', filetype: 'png', description: '5 pips', theme_id:  theme.id)

oneWormImage = Image.create(target: '6 pip die face, one worm tile', filename: 'OneWormTile', filetype: 'png', description: '1 worm for tile and 6 pip die face', theme_id:  theme.id)
twoWormImage = Image.create(target: 'two worm tile', filename: 'TwoWormTile', filetype: 'png', description: '2 worm for tile', theme_id:  theme.id)
threeWormImage = Image.create(target: 'three worm tile', filename: 'ThreeWormTile', filetype: 'png', description: '3 worm for tile', theme_id:  theme.id)
fourWormImage = Image.create(target: 'four worm tile', filename: 'FourWormTile.png', filetype: 'png', description: '4 worm for tile', theme_id:  theme.id)

# WormTiles
(21..36).map do |x|
  wormCount = (x-21)/4 + 1
  imageLookupHash = { 1 => oneWormImage, 2 => twoWormImage, 3 => threeWormImage, 4 => fourWormImage }
  WormTile.create(value: x, worm_count: wormCount, image_id: imageLookupHash[wormCount].id, theme_id: theme.id)
end

