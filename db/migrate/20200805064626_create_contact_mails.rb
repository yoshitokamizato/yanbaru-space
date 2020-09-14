class CreateContactMails < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_mails do |t|
      t.string :name
      t.string :email
      t.string :subject
      t.text :message
      t.timestamps
    end
  end
end
