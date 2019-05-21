class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :account_number
      t.references :supplier, index: { unique: true }, foreign_key: true

      t.timestamps
    end
  end
end
