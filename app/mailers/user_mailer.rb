class UserMailer < ApplicationMailer

  def send_email(email, mail_recipient)
    @email_recipient= mail_recipient
    mail(to: email, subject: @email_recipient.subject )
  end

end
