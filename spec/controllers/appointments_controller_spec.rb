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
    it "renders the pdf template" do
      { :get => appointments_pdf_path }
      expect(response).to have_http_status(:success)
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
      flash[:info].should =~ /updated/i
    end
    it 'should create an appointment' do
      post :create, :appointment => {"start(1i)" => 2016, "start(2i)" => 3, "start(3i)" => 2, "start(4i)" => 8, "start(5i)" => 30, "end(1i)" => 2016, "end(2i)" => 3, "end(3i)" => 2, "end(4i)" => 8, "end(5i)" => 30, :office_name => "Dallas Health Group"}
      flash[:info].should =~ /created/i
    end
    it 'should show an appointment' do
      @m=Itinerary.create :description => "Get Blood", :id => "1000", :care_provider_id => "1", :itinerary_status_id => 1
      get :show, :id => 1000
    end
    it 'should delete an appointment' do
       @m=Itinerary.create :description => "Get Blood", :id => "1000", :care_provider_id => "1"
       delete :destroy, :id => 1000
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
  describe 'comment function' do
    it "should generate a comment" do
        @c=Comment.create :poster_email => "test@gmail.com", :poster_name => "rock", :comment => "Eh.", :itinerary_id => "1"
        @m=Itinerary.create :start => {"start(1i)" => 2016, "start(2i)" => 3, "start(3i)" => 2, "start(4i)" => 8, "start(5i)" => 30}, :description => "Get Blood", :id => "1000", :care_provider_id => "1"
        post :comment, :itinerary_id => @m.id, :comment => @c 
        flash[:info].should =~ /posted/i
    end
  end
end