class CreateMailStores < ActiveRecord::Migration
  def change
    create_table :mail_stores do |t|
      t.string :subject
      t.string :title
      t.string :recipient
      t.string :message

      t.timestamps null: false
    end
  end
end
