class MailStoresController < ApplicationController

  def new
    @email = MailStore.new
  end

  def create
    @email = MailStore.new(mail_store_params)
    respond_to do |format|
      if @email.save
        all_recipient = @email.recipient.split(/,/)
        number_of_recipient =  all_recipient.length

        (0..number_of_recipient-1).each do |index|
          email = all_recipient[index]
          mail_recipient = MailStore.find_by_id(@email.id)
          UserMailer.send_email(email, mail_recipient).deliver_now
        end
        format.html {redirect_to new_mail_store_path , notice: 'Email send successfully'}
      else
        format.html {redirect_to new_mail_store_path , notice: 'Email failed to send try again'}
      end
    end
  end

  private

  def mail_store_params
    params.require(:mail_store).permit(:subject, :title, :recipient, :message, :attachment)
  end

end
