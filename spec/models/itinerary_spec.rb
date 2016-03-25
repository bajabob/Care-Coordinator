# spec/models/user_spe.rb
require 'rails_helper'

describe Itinerary do
	describe 'it should get all itinerary inputs by user id' do
		it 'should find user id' do
			Itinerary.get_all_by_user_id( :user_id => "1" )
		end
	end
	
	# describe 'it should bootstrap calendar hash' do
	# 	it 'should boostrap' do
	# 		Itinerary.to_bootstrap_calendar_hash()
	# 	end
	# end
end