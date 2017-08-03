class ChangeColumnToNewFromMailStores < ActiveRecord::Migration
  def change
    change_column(:mail_stores, :recipient, :text)
  end
end
