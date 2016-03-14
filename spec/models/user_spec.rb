# spec/models/user_spe.rb
require 'rails_helper'

describe User do
	it "is valid with a firstname, lastname, email, password, and phone" do
		user = User.new(
			name_first: 'Ol',
			name_last: 'Rock',
			email: 'bthoTU@gmail.com',
			password: 'passItBackAgs',
			sms_phone: '201-620-1700')
		expect(user).to be_valid
	end

	# other user tests here
end