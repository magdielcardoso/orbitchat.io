class CreateEmailChannels < ActiveRecord::Migration[8.0]
  def change
    create_table :email_channels do |t|
      t.string :email
      t.string :smtp_settings
      t.string :imap_settings
      t.boolean :active

      t.timestamps
    end
  end
end
