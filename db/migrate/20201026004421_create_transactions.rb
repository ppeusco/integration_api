# frozen_string_literal: true

class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions, id: :string do |t|
      t.string :amount
      t.string :client_id

      t.timestamps
    end
    add_index :transactions, :client_id
  end
end
