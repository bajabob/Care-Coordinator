class CareProvider < ActiveRecord::Base
	has_many :itineraries, dependent: :destroy
end
