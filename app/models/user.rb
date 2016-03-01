class User < ActiveRecord::Base
  def create_new (name_first, name_last, email, plaintext_password, sms_phone)
    @user = User.new
    @user.name_first=name_first
    @user.name_last=name_last
    @user.email=email
    @user.password=plaintext_password
    @user.sms_phone=sms_phone
    @user.save
  end
end
