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
Image.create(target: 'database-logo', filename: 'Postgresql-logo', filetype: 'png', description: 'Postgresql logo', theme_id: theme.id)
Image.create(target: 'backend-logo', filename: 'Ruby_on_Rails-logo', filetype: 'png', description: 'RoR logo', theme_id: theme.id)
Image.create(target: 'background', filename: 'BackgroundImage', filetype: 'png', description: 'Sky', theme_id: theme.id)
Image.create(target: 'title screen', filename: 'PickominoBoxCoverImage', filetype: 'png', description: 'title screen image', theme_id: theme.id)

Image.create(target: '1 pip die face', filename: 'DiceFaceOne', filetype: 'png', description: '1 pips', theme_id:  theme.id)
Image.create(target: '2 pip die face', filename: 'DiceFaceTwo', filetype: 'png', description: '2 pips', theme_id:  theme.id)
Image.create(target: '3 pip die face', filename: 'DiceFaceThree', filetype: 'png', description: '3 pips', theme_id: theme.id)
Image.create(target: '4 pip die face', filename: 'DiceFaceFour', filetype: 'png', description: '4 pips', theme_id:  theme.id)
Image.create(target: '5 pip die face', filename: 'DiceFaceFive', filetype: 'png', description: '5 pips', theme_id:  theme.id)

Image.create(target: '6 pip die face, 1 worm tile', filename: 'OneWormTile', filetype: 'png', description: '1 worm for tile and 6 pip die face', theme_id: theme.id)
Image.create(target: '2 worm tile', filename: 'TwoWormTile', filetype: 'png', description: '2 worm for tile', theme_id: theme.id)
Image.create(target: '3 worm tile', filename: 'ThreeWormTile', filetype: 'png', description: '3 worm for tile', theme_id: theme.id)
Image.create(target: '4 worm tile', filename: 'FourWormTile', filetype: 'png', description: '4 worm for tile', theme_id: theme.id)

# Phases
Phase.create(name: 'setup')
Phase.create(name: 'start game')
Phase.create(name: 'roll')
Phase.create(name: 'freeze dice')
Phase.create(name: 'take worm')
Phase.create(name: 'roll or take worm')
Phase.create(name: 'bunk')
Phase.create(name: 'game over')
