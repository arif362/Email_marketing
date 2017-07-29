class MailStoresController < ApplicationController

  def index

  end

  def new
    @email = MailStore.new
  end

  def create
    @email = MailStore.new(mail_store_params)
    respond_to do |format|
      if @email.save
        UserMailer.send_email(@email).deliver_now
        format.html {redirect_to mail_stores_path , notice: 'Email saved successfully'}
      else
        format.html {render :new, notice: 'E-mail failed to saved'}
      end
    end
  end


  def template

  end

  private

  def mail_store_params
    params.require(:mail_store).permit(:subject, :title, :recipient, :message, :attachment)
  end

end
