class AddAttachmentToMailStores < ActiveRecord::Migration
  def change
    add_column :mail_stores, :attachment, :string
  end
end
