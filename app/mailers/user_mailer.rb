UserMailer.welcome(user: @user, subject: "Welcome!").deliver_now
class UserMailer < ApplicationMailer
    default from: "test@test.com"

  def welcome(user: , subject: , template: "default" )

    # template's default view is "default"
    headers "X-SMTPAPI" => {
     "sub": {
       "-clinicName-" => "test"
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
      from: 'test@test.com',
      to: 'bailey.bauman@tamu.edu',
      subject: subject,
      template_path: 'path/to/view',
      template_name: template
    )
    # this would try to render the view: `path/to/view/default.erb`
  end
end
