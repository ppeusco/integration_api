# frozen_string_literal: true

# Add  the type column to Transactions table
class AddTypeToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :type, :integer
  end
end
