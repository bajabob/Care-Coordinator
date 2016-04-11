class Itinerary < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :care_provider
  has_one :itinerary_status

  def self.get_all_by_user_id (user_id)
    self.where(:user_id => user_id)
  end

  def to_bootstrap_calendar_hash

    puts self.inspect

    # JSON properties can be found here
    # https://github.com/Serhioromano/bootstrap-calendar
    # https://www.youtube.com/watch?v=dQw4w9WgXcQ
    s = "/appointments/#{self.id}"
    if self.itinerary_status_id == 1
        title = '(Needs Verified) '
        css = 'event-warning'
    elsif self.itinerary_status_id == 2
        title = '(Pending) '
        css = 'event-grey'
    elsif self.itinerary_status_id == 3
      title = '(Approved) '
      css = 'event-success'
    else
        title = '(Denied) '
        css = 'event-important'
    end
    
    object = {
        :id     => self.id,
        :title  => title + self.description,
        :url    => s,
        :class  => css,
        :start  => self.start.to_time.to_i * 1000,  # convert to milliseconds
        :end    => self.end.to_time.to_i * 1000     # convert to milliseconds
    }

    return object
  end
end