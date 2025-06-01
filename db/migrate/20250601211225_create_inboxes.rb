class CreateInboxes < ActiveRecord::Migration[8.0]
  def change
    create_table :inboxes do |t|
      t.string :name
      t.references :account, null: false, foreign_key: true
      t.string :channel_type
      t.boolean :active
      t.text :settings

      t.timestamps
    end
  end
end
