class WelcomeMailer < ApplicationMailer
  default from: 'notifications@example.com'

 def welcome_email
   @user = params[:user]
   mail(to: @user.email, subject: 'welcome to my family!')
 end
end
