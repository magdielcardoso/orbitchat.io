class CreateApiChannels < ActiveRecord::Migration[8.0]
  def change
    create_table :api_channels do |t|
      t.string :webhook_url
      t.string :token
      t.boolean :active
      t.jsonb :settings, default: {}

      t.timestamps
    end
  end
end
