class UserMailer < ApplicationMailer
  default from: "bailey.bauman@tamu.edu"


  # invoke using...
  # UserMailer.request_verification(
  #     current_user,
  #     CareProvider.where(:id => 1).first,
  #     Itinerary.where(:id => 1).first).deliver_now
  def request_verification( user, care_provider, itinerary )
    headers "X-SMTPAPI" => {
      "sub": {
          "-clinicName-": [care_provider.office_name],
          "-patientName-": [user.name_first + " " + user.name_last],
          "-doctorName-": [care_provider.physician_name],
          "-startDate-": [itinerary.start],
          "-endDate-": [itinerary.end],

          ## todo, make link to google maps
          "-location-": [care_provider.address_line_one + " in " + care_provider.city],

          ## todo, should be a link to production or locahost
          "-link-": ['http://carecoordinator.heroku.com/'],
      },
     "filters": {
       "templates": {
         "settings": {
           "enable": 1,
           "template_id": '89c71dde-cb95-40d7-87d2-d73709dd1bee'
         }
       }
     }
    }.to_json

    mail(
      from: user.email,
      to: care_provider.office_email,
      subject: "",
      template_path: 'user_mailer',
      template_name: "blank"
    )
  end
end
