class CreateConversations < ActiveRecord::Migration[8.0]
  def change
    create_table :conversations do |t|
      t.references :inbox, null: false, foreign_key: true
      t.references :contact, null: false, foreign_key: true
      t.string :status
      t.datetime :last_activity_at
      t.text :metadata

      t.timestamps
    end
    add_index :conversations, :status
    add_index :conversations, :last_activity_at
    add_index :conversations, :inbox_id
    add_index :conversations, :contact_id
  end
end
