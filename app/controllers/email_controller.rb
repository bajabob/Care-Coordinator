class EmailController < ApplicationController

  require 'securerandom'

  def verify

    random_string = SecureRandom.hex
    care_provider = CareProvider.find(params[:care_provider_id])
    itinerary = Itinerary.find(params[:itinerary_id])

    link = email_providerresponse_url :key => random_string.to_s

    EmailLink.create(
        :auth_token => random_string.to_s,
        :to_email => care_provider.office_email,
        :to_name => care_provider.office_name,
        :user_id => current_user.id
    )

    UserMailer.request_verification(current_user, care_provider, itinerary, link).deliver_now

    flash[:info] = "Provider has been emailed and should respond shortly."
    redirect_to appointments_view_path
  end

  def providerresponse
    p params[:key]
  end
end
