class NotificationObserver < ActiveRecord::Observer
   observe :comment, :update
  
  def after_create(record)
    # send notification
  end
end