class ItineraryStatus < ActiveRecord::Migration
  def change
    create_table :itinerary_statuses do |t|
      t.string :const
      t.timestamps null: false
    end
  end
end
