require 'rails_helper'

#https://github.com/kendallflutey/rspec-controller-testing

#Change "ItemController" to the appropriate name
describe AppointmentsController do
  describe 'view' do
    pending
  end

  describe 'new' do
    pending
  end

  describe 'create' do
    it 'should create a new appointment' do
      #AppointmentsController.stub(:create).and_return(double('Appointment'))
      @a=Itinerary.create!(:description => "Test Appt", :care_provider_id => "", 
      :user_id => "1", :start => "", :end => "")
      post :create, {:id => "1"}
    end
  end

  describe 'edit' do
    pending
    it 'should edit an apointment' do
      @a=Itinerary.create!(:description => "Test Appt", 
      :care_provider_id => "", :user_id => "1", 
      :start => ""
      :end => "")
      get :edit, id: @a
      assigns(:movie).should == @a
    end
  end

  describe 'update' do
    pending
    it 'should update an appointment' do
      appt = Itenerary.create
      put :update, :id => movie
      flash[:notice].should =~ /updated/i
    end
  end

  describe 'destory' do
    pending
  end

  describe 'show' do
    pending
  end
end