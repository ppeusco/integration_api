# frozen_string_literal: true

class RenameTypeToTransactionTypeInTransactions < ActiveRecord::Migration[6.0]
  def up
    rename_column :transactions, :type, :transaction_type
  end

  def down
    rename_column :transactions, :transaction_type, :type
  end
end
