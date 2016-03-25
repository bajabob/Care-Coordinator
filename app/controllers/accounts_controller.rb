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
    end

    if(params.include?('email'))
      flash[:warning] = 'Invalid Email/Password Combination'
    end

  end

  def new
    # todo issue #95
  end

  def create
    # todo issue #95

    if(params[:password] == params[:password_confirm])
      puts 'passwords match'
      bcrypt = BCrypt::Password.create(params[:password])
      @account = User.create!(:name_first => params[:first_name], :name_last => [:last_name], :email => params[:email], :sms_phone => params[:phone], :password => bcrypt)


      session[:user_id] = @account.id
      flash[:info] = "#{@account.name_first} was successfully created."
      redirect_to appointments_view_path
    else
      flash[:warning] = 'Passwords do not match'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
end
