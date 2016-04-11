class AddAppointmentIToEmailLinks < ActiveRecord::Migration
  def change
    add_column :email_links, :itinerary_id, :integer
  end
end
