class User < ActiveRecord::Base
  has_many :email_links
  has_many :itineraries
end
