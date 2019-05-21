class CreateAccounthistories < ActiveRecord::Migration[5.2]
  def change
    create_table :accounthistories do |t|
      t.string :credit_rating
      t.references :account, index: { unique: true }, foreign_key: true

      t.timestamps
    end
  end
end
