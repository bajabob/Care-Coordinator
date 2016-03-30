require 'rails_helper'

RSpec.describe AccountsController, type: :controller do

  describe "GET #login" do
    it "returns http success" do
      if session[:user_id].present?
        get :login
        expect(response).to have_http_status(:success)
      else
        @u=User.create :name_first => "a", :name_last => "a", :email => "testemail@gmail.com", :sms_phone => "a", :password => "pass"
        current_user = @u
        session[:user_id] = @u.id
        get :login
        expect(response).to have_http_status(:redirect)
      end
    end
    it "returns http redirect" do
      if !session[:user_id].present?
        get :login
        expect(response).to have_http_status(:success)
      end
    end
    it "login not right" do
        post :login, :email => "bailey.bauman@tamu.edu", :password => "wrong"
        flash[:warning].should =~ /Invalid/i
    end
  end
  describe "create" do 
    it 'should create an appointment' do
      post :create, :user => {:name_first => "a", :name_last => "a", :email => "testemail@gmail.com", :sms_phone => "a", :password => "pass", :password_confirm => "pass"}
      flash[:info].should =~ /created/i
    end
    it 'should not create an appointment' do
      post :create, :user => {:name_first => "b", :name_last => "b", :email => "random@gmail.com", :sms_phone => "b", :password => "pass", :password_confirm => "pass2"}
      flash[:warning].should =~ /match/i
    end
  end
  describe "logout" do 
    it 'should post logout' do
      post :logout
      { :get => accounts_logout_path }.
        should route_to(:controller => "accounts", :action => "logout")
    end
    it 'should not create an appointment' do
      post :create, :user => {:name_first => "b", :name_last => "b", :email => "random@gmail.com", :sms_phone => "b", :password => "pass", :password_confirm => "pass2"}
      flash[:warning].should =~ /match/i
    end
  end
end
