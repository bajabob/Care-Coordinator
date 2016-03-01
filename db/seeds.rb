# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

testDb = [{:title => 'The test works'}]

testDb.each do |test|
  Test.create!(test)
end

# add some test users
users = User.create(
    [
        {
            name_first:   'JFair',
            name_last:    'Sanchez',
            email:        'jFairess@supercool.net',
            password:     'long hash',
            sms_phone:    '2123334444',
        },
        {
            name_first:   'Dan',
            name_last:    'Fairplay',
            email:        'suhdude@gmail.com',
            password:     'long hash',
            sms_phone:    '5556668989',
        }
    ]
)

