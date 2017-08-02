class UserMailer < ApplicationMailer

  def send_email(email, mail_recipient)
    @email_recipient= mail_recipient
    # attachments["profile.pdf"] = mail_recipient.attachment.path
     attachments["profile.pdf"] = open("#{mail_recipient.attachment.path}").read

    mail(to: email, subject: @email_recipient.subject )
  end

end
