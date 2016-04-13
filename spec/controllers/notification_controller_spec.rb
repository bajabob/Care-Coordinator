require 'rails_helper'

describe NotificationController, type: :controller do
	describe "It renders templates" do
		it "should render the index template" do
			get :index
			expect(response).to render_template("index")
		end
		it "creates a new notifcation" do
			@n = Notification.create!(:description => "eh", :read_status => false )
			get :index
			expect(@n.read_status).to be(false)
		end
	end
end
