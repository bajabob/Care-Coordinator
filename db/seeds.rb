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
#User.create_new('J-Fair', 'Sanchez','jFairess@supercool.net','long hash','2123334444',)
#User.create_new('Dan', 'Fairplay','suhdude@gmail.com','long hash','5556668989',)
