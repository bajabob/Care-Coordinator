class Itinerary < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|
      t.datetime :start
      t.datetime :end
      t.string :description
      t.belongs_to :itinerary_status, :class_name => "ItineraryStatus", :foreign_key => "itinerary_status_id"
      t.belongs_to :user, :class_name => "User", :foreign_key => "user_id"
      t.belongs_to :care_provider, :class_name => "CareProvider", :foreign_key => "care_provider_id"
      t.timestamps null: false
    end
  end
end
