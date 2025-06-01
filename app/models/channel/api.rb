class Channel::Api < ApplicationRecord
  self.table_name = "api_channels"

  has_many :inboxes, as: :channel

  # Exemplos de campos típicos (a migration deve criar esses campos):
  # t.string :webhook_url
  # t.string :token
  # t.jsonb :settings
  # t.boolean :active
end
