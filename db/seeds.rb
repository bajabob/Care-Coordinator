# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'date'

testDb = [{:title => 'The test works'}]

testDb.each do |test|
  Test.create!(test)
end



# add some test users
require 'bcrypt'

# how to use bcrypt: https://github.com/codahale/bcrypt-ruby
password = BCrypt::Password.create("cc2016")

User.create(
  [
    {
      	name_first: 	'Bailey',
	name_last:	'Bauman',
	email:		'bailey.bauman@tamu.edu',
	password: 	password,
	sms_phone:	'5806497685'
    }
  ]
)

User.create(
  [
    {
        name_first:     'Bob',
        name_last:      'Timm',
        email:          'bobtimm@tamu.edu',
        password:       password,
        sms_phone:      '2144917357'
    }
  ]
)

User.create(
  [
    {
        name_first:     'J',
        name_last:      'Fair',
        email:          'jfairchild23@gmail.com',
        password:       password,
        sms_phone:      '9076870599'
    }
  ]
)

User.create(
  [
    {
        name_first:     'Lance',
        name_last:      'Badoni',
        email:          'lancebadoni@tamu.edu',
        password:       password,
        sms_phone:      '8323737828'
    }
  ]
)

User.create(
  [
    {
        name_first:     'Matt',
        name_last:      'Dyl',
        email:          'madpd@tamu.edu',
        password:       password,
        sms_phone:      '8172917179'
    }
  ]
)

User.create(
  [
    {
        name_first:     'Nico',
        name_last:      'Warner',
        email:          'srgunny@gmail.com',
        password:       password,
        sms_phone:      '2023783099'
    }
  ]
)

#care provicders
CareProvider.create([{
	office_name: 		'Dallas Health Group',
	office_phone:		'2144815567',
	office_phone_ext: 	'',
	office_email:		'carecoordinator16@gmail.com',
	address_line_one:	'123 Dallas North Tollway',
	address_line_two:	'Suite 3000',
	city:			'Addison',
	state:			'TX',
	zip:			'75076',
	physician_name:		'Dr. John Palmer'
}])

CareProvider.create([{
        office_name:            'Houston Health Partners',
        office_phone:           '2157774444',
        office_phone_ext:       '123',
        office_email:           'carecoordinator16@gmail.com',
        address_line_one:       '144 Dalaware Ave.',
        address_line_two:       '',
        city:                   'Houston',
        state:                  'TX',
        zip:                    '77785',
        physician_name:         'Dr. Cassandra May'
}])

CareProvider.create([{
        office_name:            'xActive Imaging Lab',
        office_phone:           '9704565565',
        office_phone_ext:       '45',
        office_email:           'carecoordinator16@gmail.com',
        address_line_one:       '42 Firefly Dr.',
        address_line_two:       'Suite 80',
        city:                   'Paris',
        state:                  'TX',
        zip:                    '78898',
        physician_name:         'Dr. Satya Steele'
}])

# create itinerary status
ItineraryStatus.create([{const: 'EMAIL-NOT-YET-SENT'}])
ItineraryStatus.create([{const: 'EMAIL-SENT-STATUS-PENDING'}])
ItineraryStatus.create([{const: 'PROVIDER-APPROVED'}])
ItineraryStatus.create([{const: 'PROVIDER-DENIED'}])

# itineraries i & comments

cpDallas = CareProvider.find_by_id(1)
cpHouston = CareProvider.find_by_id(2)
cpParis = CareProvider.find_by_id(3)

notSent = ItineraryStatus.find_by_const('EMAIL-NOT-YET-SENT')
isPending = ItineraryStatus.find_by_const('EMAIL-SENT-STATUS-PENDING')
isApproved = ItineraryStatus.find_by_const('PROVIDER-APPROVED')
isDenied = ItineraryStatus.find_by_const('PROVIDER-DENIED')

currMonth = Date.today.month

User.all.each do |user|
  Itinerary.create([{
        start:          	DateTime.new(2016,currMonth,15,12,0,0), # 3/3 @ 12 (noon)
        end:            	DateTime.new(2016,currMonth,15,14,0,0), # 3/3 @ 2pm
        description:    	'Getting blood work done',
        itinerary_status_id: 	isDenied.id,
        user_id: 		user.id,
	care_provider_id:	cpDallas.id
  }])

  Comment.create([{
        poster_email:           user.email,
        poster_name:            user.name_first,
        comment:                'Can you let me know why this was denied?',
        itinerary_id:           Itinerary.maximum(:id),
  }])
  Comment.create([{
        poster_email:           cpDallas.office_email,
        poster_name:            cpDallas.office_name,
        comment:                'We overbooked that time, we are working to get you a new timeslot',
        itinerary_id:           Itinerary.maximum(:id),
  }])


  Itinerary.create([{
        start:                  DateTime.new(2016,currMonth,15,14,0,0), # 3/3 @ 2pm
        end:                    DateTime.new(2016,currMonth,15,15,0,0), # 3/3 @ 4pm
        description:            'Meeting with doctor about my recovery',
        itinerary_status_id:    isApproved.id,
        user_id:                user.id,
        care_provider_id:       cpHouston.id
  }])

  Comment.create([{
        poster_email:           user.email,
        poster_name:            user.name_first,
        comment:                'Thank you for approving this!',
        itinerary_id:           Itinerary.maximum(:id),
  }])
  Comment.create([{
        poster_email:           cpHouston.office_email,
        poster_name:            cpHouston.office_name,
        comment:                'No problem!',
        itinerary_id:           Itinerary.maximum(:id),
  }])


  Itinerary.create([{
        start:                  DateTime.new(2016,currMonth,16,16,0,0), # 3/3 @ 4pm
        end:                    DateTime.new(2016,currMonth,16,18,0,0), # 3/3 @ 6pm
        description:            'Last treatment!',
        itinerary_status_id:    isPending.id,
        user_id:                user.id,
        care_provider_id:       cpParis.id
  }])

  Comment.create([{
        poster_email:           user.email,
        poster_name:            user.name_first,
        comment:                'Any feedback on this yet?',
        itinerary_id:           Itinerary.maximum(:id),
  }])
  Comment.create([{
        poster_email:           cpParis.office_email,
        poster_name:            cpParis.office_name,
        comment:                'We are looking into it, we will followup soon.',
        itinerary_id:           Itinerary.maximum(:id),
  }])
  Comment.create([{
        poster_email:           cpParis.office_email,
        poster_name:            cpParis.office_name,
        comment:                'Okay, it looks like we can put you down for 4pm.',
        itinerary_id:           Itinerary.maximum(:id),
  }])

  Itinerary.create([{
      start:                  DateTime.new(2016,currMonth,16,12,0,0), # 3/3 @ 4pm
      end:                    DateTime.new(2016,currMonth,16,14,0,0), # 3/3 @ 6pm
      description:            'Meeting with Dr. Shipley',
      itinerary_status_id:    notSent.id,
      user_id:                user.id,
      care_provider_id:       cpParis.id
  }])

end





