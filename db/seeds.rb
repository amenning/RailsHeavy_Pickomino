# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Image.create(filename: 'AngularJS-Shield-large', filetype: 'png', description: 'Angular JS logo')
Image.create(filename: 'Postgresql-logo', filetype: 'png', description: 'Postgresql logo')
Image.create(filename: 'Ruby_on_Rails-logo', filetype: 'png', description: 'RoR logo')
Image.create(filename: 'BackgroundImage', filetype: 'png', description: 'Sky')
Image.create(filename: 'PickominoBoxCoverImage', filetype: 'png', description: 'title screen image')

Image.create(filename: 'DiceFaceOne', filetype: 'png', description: '1 pips')
Image.create(filename: 'DiceFaceTwo', filetype: 'png', description: '2 pips')
Image.create(filename: 'DiceFaceThree', filetype: 'png', description: '3 pips')
Image.create(filename: 'DiceFaceFour', filetype: 'png', description: '4 pips')
Image.create(filename: 'DiceFaceFive', filetype: 'png', description: '5 pips')

Image.create(filename: 'OneWormTile', filetype: 'png', description: '1 worm for tile and 6 pip die face')
Image.create(filename: 'TwoWormTile', filetype: 'png', description: '2 worm for tile')
Image.create(filename: 'ThreeWormTile', filetype: 'png', description: '3 worm for tile')
Image.create(filename: 'FourWormTile.png', filetype: 'png', description: '4 worm for tile')



