class UserMailer < ActionMailer::Base
  default from: "Colin <notifications@bellyguide.com>"

  def welcome_email(user)
    @user = user
    @url = "http://bellyguide.herokuapp.com//"
    mail(to: "#{user.username} <#{user.email}>", subject: "Welcome to Belly Guide!")
  end
end
