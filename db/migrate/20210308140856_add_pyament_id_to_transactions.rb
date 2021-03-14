# frozen_string_literal: true

# Add the payment_id column to the Transactions table
class AddPyamentIdToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :payment_id, :string, index: true
  end
end
