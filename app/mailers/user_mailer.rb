class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.notify_user.subject
  #

  def notify_user(user)
    @user = user
    puts @user.email
    mail(
      :subject => 'Welcome to Scenario',
      :to      => @user.email,
    )
  end
end
