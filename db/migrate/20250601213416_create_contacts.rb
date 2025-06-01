class CreateContacts < ActiveRecord::Migration[8.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.references :account, null: false, foreign_key: true
      t.text :metadata

      t.timestamps
    end
  end
end
