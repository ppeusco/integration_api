# frozen_string_literal: true

# Rename the type column to transaction_type in Transactions table
class RenameTypeToTransactionTypeInTransactions < ActiveRecord::Migration[6.0]
  def up
    rename_column :transactions, :type, :transaction_type
  end

  def down
    rename_column :transactions, :transaction_type, :type
  end
end
