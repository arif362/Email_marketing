class MailStore < ActiveRecord::Base

  mount_uploader :attachment, FileUploader


end
