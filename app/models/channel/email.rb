class Channel::Email < ApplicationRecord
  self.table_name = "email_channels"

  has_many :inboxes, as: :channel

  # Exemplos de campos típicos (a migration deve criar esses campos):
  # t.string :email
  # t.string :smtp_settings
  # t.string :imap_settings
  # t.boolean :active
end
