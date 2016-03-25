require 'rails_helper'

RSpec.describe AccountsController, type: :controller do

  describe "GET #login" do
    it "returns http success" do
      get :login
      expect(response).to have_http_status(:success)
    end
  end
  describe "create" do 
    it 'should create an appointment' do
      post :create, :user => {:name_first => "a", :name_last => "a", :email => "a", :sms_phone => "a", :password => "pass", :password_confirm => "pass"}
      flash[:info].should =~ /created/i
    end
    it 'should not create an appointment' do
      post :create, :user => {:name_first => "b", :name_last => "b", :email => "b", :sms_phone => "b", :password => "pass", :password_confirm => "pass2"}
      flash[:warning].should =~ /match/i
    end
  end
end
