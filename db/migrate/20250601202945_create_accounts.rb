class CreateAccounts < ActiveRecord::Migration[8.0]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
    add_index :accounts, :email, unique: true
    add_index :accounts, :name
  end
end
