class MailStoresController < ApplicationController

  def new
    @email = MailStore.new
  end

  def create
    @email = MailStore.new(mail_store_params)
    respond_to do |format|
      if @email.save
        UserMailer.send_email(@email).deliver_now
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
