class Itinerary < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  def self.get_all_by_user_id (user_id)
    self.where(:user_id => user_id)
  end

  def to_bootstrap_calendar_hash

    # JSON properties can be found here
    # https://github.com/Serhioromano/bootstrap-calendar
    # https://www.youtube.com/watch?v=dQw4w9WgXcQ
    s = "/appointments/#{self.id}"
    object = {
        :id     => self.id,
        :title  => self.description,
        :url    => s,
        :class  => 'event-success',
        :start  => self.start.to_time.to_i * 1000,  # convert to milliseconds
        :end    => self.end.to_time.to_i * 1000     # convert to milliseconds
    }

    return object
  end
end