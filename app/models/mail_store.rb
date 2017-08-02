class MailStore < ActiveRecord::Base

  mount_uploader :attachment, FileUploader

  validates_presence_of :subject, :title, :recipient, :message

  def self.import(file,params)
    require 'csv'
    CSV.foreach(file.path, headers: true) do |row|
      already_sent = MailStore.where(recipient: row[0])
      unless already_sent.present?
        email = MailStore.new
        email.recipient = row[0]
        email.subject = params[:subject]
        email.title = params[:title]
        email.message = params[:message]
        email.attachment = params[:attachment]
        email.save
        Delayed::Job.enqueue(EmailSendJob.new(email))
      end
    end
  end


end
