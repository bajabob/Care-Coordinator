class EmailController < ApplicationController

  require 'securerandom'

  def verify

    # vars
    random_string = SecureRandom.hex
    care_provider = CareProvider.find(params[:care_provider_id])
    itinerary = Itinerary.find(params[:itinerary_id])
    link = email_providerresponse_url :key => random_string.to_s

    # create record of email being sent
    EmailLink.create(
        :auth_token => random_string.to_s,
        :to_email => care_provider.office_email,
        :to_name => care_provider.office_name,
        :user_id => current_user.id,
        :itinerary_id => itinerary.id
    )

    # send email
    UserMailer.request_verification(current_user, care_provider, itinerary, link).deliver_now

    # mark appointment as pending
    itinerary_status = ItineraryStatus.find_by_const('EMAIL-SENT-STATUS-PENDING')
    itinerary.update(:itinerary_status_id => itinerary_status.id)

    # respond to user
    flash[:info] = "Provider has been emailed and should respond shortly."
    redirect_to appointments_view_path
  end

  def providerresponse
    # make sure we have a record of this transaction
    transaction = EmailLink.find_by_auth_token(params[:key])

    if(transaction.present?)
      @appointment = Itinerary.find(transaction.itinerary_id)
      @careProvider = CareProvider.find(@appointment.care_provider_id)
      @comments = Comment.where(:itinerary_id => @appointment.id)
      @patient = User.find(transaction.user_id)
      @key = params[:key]
    else
      redirect_to email_invalidkey_path
    end
  end

  def invalidkey
    # left intentionally blank
  end

  def complete
  # left intentionally blank
  end

  def comment

    itinerary_id = params[:itinerary_id]
    comment = params[:comment]
    user_id = params[:user_id]

    @user = User.find(user_id)
    @itinerary = Itinerary.find(itinerary_id)
    @care_provider = CareProvider.find(@itinerary.care_provider_id)

    random_string = SecureRandom.hex
    link = email_providerresponse_url :key => random_string.to_s

    # create record of email being sent
    EmailLink.create(
        :auth_token => random_string.to_s,
        :to_email => @care_provider.office_email,
        :to_name => @care_provider.office_name,
        :user_id => @user.id,
        :itinerary_id => @itinerary.id
    )

    UserMailer.comment_for_user(@user, @care_provider, link).deliver_now

    Comment.create(
        :poster_email => @care_provider.office_email,
        :poster_name => @care_provider.office_name,
        :comment => comment,
        :itinerary_id => @itinerary.id
    )

    flash[:info] = "Your comment has been posted and " + @user.name_first + " has been notified"
    redirect_to email_complete_path

  end

  def approve
    # make sure we have a record of this transaction
    transaction = EmailLink.find_by_auth_token(params[:key])

    if(transaction.present?)

      # mark appointment as pending
      itinerary = Itinerary.find(transaction.itinerary_id)
      itinerary_status = ItineraryStatus.find_by_const('PROVIDER-APPROVED')
      itinerary.update(:itinerary_status_id => itinerary_status.id)

      @notification = Notification.create!(:description => "#{itinerary.description} has been approved.", 
                  :read_status => false)

      redirect_to email_complete_path
    else
      redirect_to email_invalidkey_path
    end
  end

  def deny
    # make sure we have a record of this transaction
    transaction = EmailLink.find_by_auth_token(params[:key])

    if(transaction.present?)

      # mark appointment as pending
      itinerary = Itinerary.find(transaction.itinerary_id)
      itinerary_status = ItineraryStatus.find_by_const('PROVIDER-DENIED')
      itinerary.update(:itinerary_status_id => itinerary_status.id)

      @notification = Notification.create!(:description => "#{itinerary.description} has been denied.", 
                  :read_status => false)

    else
      redirect_to email_invalidkey_path
    end
  end
end
