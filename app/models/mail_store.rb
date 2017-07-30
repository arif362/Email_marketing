class MailStore < ActiveRecord::Base

  mount_uploader :attachment, FileUploader

  validates_presence_of :subject, :title, :recipient, :message


end
