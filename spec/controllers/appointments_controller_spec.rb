require 'rails_helper'

describe AppointmentsController do
  # log in a user
  before (:each) do
    session[:user_id] = "1"
  end

  describe "It renders the templates" do
    it "renders the view template" do
      get :view
      expect(response).to render_template("view")
    end
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
    it "renders the edit template" do
      { :get => edit_appointment_path(1) }.
        should route_to(:controller => "appointments", :action => "edit", :id => "1")
    end
    it "renders the show template" do
      { :get => appointment_path(1) }.
        should route_to(:controller => "appointments", :action => "show", :id => "1")
    end
  end
  describe "It edits and creates correctly" do
    it 'should edit an appointment' do
      @m=Itinerary.create :description => "Get Blood", :id => "1000", :care_provider_id => "1"
      get :edit, id: @m
      assigns(:appointment).should == @m
    end
     it 'should update an appointment' do
      @m=Itinerary.create :start => {"start(1i)" => 2016, "start(2i)" => 3, "start(3i)" => 2, "start(4i)" => 8, "start(5i)" => 30}, :description => "Get Blood", :id => "1000", :care_provider_id => "1"
      put :update, :id => "1000", :appointment => {"start(1i)" => 2016, "start(2i)" => 3, "start(3i)" => 2, "start(4i)" => 8, "start(5i)" => 30, "end(1i)" => 2016, "end(2i)" => 3, "end(3i)" => 2, "end(4i)" => 8, "end(5i)" => 30, :care_provider_id => "Dallas Health Group"}
      flash[:notice].should =~ /updated/i
    end
    it 'should create an appointment' do
      @m=Itinerary.create :start => {"start(1i)" => 2016, "start(2i)" => 3, "start(3i)" => 2, "start(4i)" => 8, "start(5i)" => 30}, :description => "Get Blood", :id => "1000", :care_provider_id => "1"
      post :create, :appointment => {"start(1i)" => 2016, "start(2i)" => 3, "start(3i)" => 2, "start(4i)" => 8, "start(5i)" => 30, "end(1i)" => 2016, "end(2i)" => 3, "end(3i)" => 2, "end(4i)" => 8, "end(5i)" => 30, :office_name => "Dallas Health Group"}
      flash[:notice].should =~ /created/i
    end
  end
  describe "convert date functions" do
    it 'should convert start date' do
      date = {"start(1i)" => 2016, "start(2i)" => 3, "start(3i)" => 2, "start(4i)" => 8, "start(5i)" => 30}
      newDate = controller.convertStart date
      newDate.should == "2016-03-02T08:30:00+00:00"
    end
    it 'should convert end date' do
      date = {"end(1i)" => 2016, "end(2i)" => 3, "end(3i)" => 2, "end(4i)" => 8, "end(5i)" => 30}
      newDate = controller.convertEnd date
      newDate.should == "2016-03-02T08:30:00+00:00"
    end
  end

  
end