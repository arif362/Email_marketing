class EmailSendJob < Struct.new(:email)

  def perform
    p '*********************************'

    all_recipient = email.recipient.split(/,/)
    number_of_recipient =  all_recipient.length

    (0..number_of_recipient-1).each do |index|
      email_address = all_recipient[index]
      mail_recipient = MailStore.find_by_id(email.id)
      UserMailer.send_email(email_address, mail_recipient).deliver_now
    end
    p '************************************'
  end

end