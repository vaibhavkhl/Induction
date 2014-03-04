class UserObserver < ActiveRecord::Observer
  def after_create(user)
    # send email to user
  end
end