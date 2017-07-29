class UserMailer < ApplicationMailer

  def send_email(email)
    @email= email
    mail(to: email.recipient, subject: 'Email send successfully')
  end

end
