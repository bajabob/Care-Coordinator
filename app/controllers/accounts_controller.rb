require 'bcrypt'

class AccountsController < ApplicationController

  layout "landing"

  def login
    puts params

    #make sure emails are unique in the database
    @user = User.where(:email => params['email']).first

    if(@user.present?)
      bcrypt = BCrypt::Password.new(@user.password)
      if(bcrypt == params['password'])
        session[:user_id] = @user.id
        redirect_to appointments_view_path
        return
      end
    else
      flash[:warning] = 'Invalid Email/Password Combination'
      return
    end

    if(params.include?('email'))
      
    end

  end

  def new
    # todo issue #95
  end

  def create
    # todo issue #95
    puts params.inspect
    if(params[:user][:password] == params[:user][:password_confirm])
      puts 'passwords match'
      bcrypt = BCrypt::Password.create(params[:user][:password])
      @account = User.create!(:name_first => params[:user][:first_name], :name_last => params[:user][:last_name],
                              :email => params[:user][:email], :sms_phone => params[:user][:phone], :password => bcrypt)


      session[:user_id] = @account.id
      flash[:info] = "#{@account.name_first} was successfully created."
      redirect_to appointments_view_path
    else
      puts 'passwords dont match'
      flash[:warning] = 'Passwords do not match'
      redirect_to new_appointment_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
end
