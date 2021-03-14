# frozen_string_literal: true

# Create the Transactions table
class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions, id: :string do |table|
      table.string :amount
      table.string :client_id

      table.timestamps
    end
    add_index :transactions, :client_id
  end
end
