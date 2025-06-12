class CreateMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.references :conversation, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true
      t.references :inbox, null: false, foreign_key: true
      t.boolean :private
      t.integer :status
      t.references :sender, polymorphic: true, null: false

      t.timestamps
    end
    add_index :messages, :status
    add_index :messages, :created_at
    add_index :messages, :conversation_id
    add_index :messages, :account_id
    add_index :messages, :inbox_id
    add_index :messages, [ :sender_type, :sender_id ]
  end
end
