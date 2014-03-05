class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  def welcome_email(user)
    mail(to: user.email, subject: 'Welcome to My Awesome Site') do |format|
      format.html #{ render layout: 'my_layout' }
      #format.text
    end
  end
end
