class NotificationMailer < ActionMailer::Base
   default from: "admin@ODCInduction.com"
   def new_update_email(user)
     mail(to: user.email, subject: 'New update') do |format|
       format.html
     end
   end
 
   def new_comment_email(user)
     mail(to: user.email, subject: 'New comment') do |format|
       format.html
     end
   end
end