class NotificationController < ApplicationController
    def index
        @notifications = Notification.all.sort{|x, y| y.created_at <=>  x.created_at}

        @n = Notification.where(:read_status => false)

        @n.each do |notification|
            notification.update(:read_status => true)
        end

    end
end
