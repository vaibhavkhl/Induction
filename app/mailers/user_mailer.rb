class UserMailer < ActionMailer::Base
  default from: "admin@ODCInduction"
  include Users::AdminsHelper
  def welcome_email(user)
  	@user = user
    @url = 'dev-utility-lx53.amdc.mckinsey.com/ODCInduction'
    mail(to: user.email, subject: 'Welcome to ODCInduction') do |format|
      format.html #{ render layout: 'my_layout' }
      #format.text
    end
  end

  def mentees_updates_email(email)
    @mentees = get_mentees
    mail(to: email, subject: 'ODCInduction Updates Report') do |format|
      format.html #{ render layout: 'my_layout' }
      #format.text
    end
  end
end
