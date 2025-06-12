class CreateInboxes < ActiveRecord::Migration[8.0]
  def change
    create_table :inboxes do |t|
      t.string :name
      t.references :account, null: false, foreign_key: true
      t.string :channel_type
      t.bigint :channel_id
      t.boolean :active

      t.timestamps
    end
    add_index :inboxes, [ :channel_type, :channel_id ]
    add_index :inboxes, :account_id
    add_index :inboxes, :active
  end
end
