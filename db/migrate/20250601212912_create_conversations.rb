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
  end
end
