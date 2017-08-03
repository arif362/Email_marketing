class ChangeColumnMessageToMailStores < ActiveRecord::Migration
  def change
    change_column(:mail_stores, :message, :text)
  end
end
