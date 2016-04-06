require 'rails_helper'

RSpec.describe ProvidersController, type: :controller do
  # log in a user
  before (:each) do
    session[:user_id] = "1"
  end

  describe "It renders the templates" do
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
    it "renders the edit template" do
      { :get => edit_provider_path(1) }.
        should route_to(:controller => "providers", :action => "edit", :id => "1")
    end
    it "renders the show template" do
      { :get => provider_path(1) }.
        should route_to(:controller => "providers", :action => "show", :id => "1")
    end
  end
  describe "It edits and creates correctly" do
    it 'should edit a care provider' do
      @m=CareProvider.create :office_name => "Derp Health", :id => "1000" 
      get :edit, id: @m
      assigns(:provider).should == @m
    end
     it 'should update a care provider' do
      @m=CareProvider.create :office_name => "Derp Health", :id => "1000"
      put :update, :id => "1000", :provider => { :office_name => "Herp Health" }
      flash[:info].should =~ /updated/i
    end
    it 'should create a care provider' do
      post :create, :provider => { :office_name => "Test Health"}
      flash[:info].should =~ /created/i
    end
    it 'should show a care provider' do
      @m=CareProvider.create :office_name => "Test Health Derp", :id => "1000"
      get :show, :id => 1000
    end
    it 'should delete a care provider' do
       @m=CareProvider.create :office_name => "Herp Derp Health", :id => "1000"
       delete :destroy, :id => 1000
    end

  end
end
