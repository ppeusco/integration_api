# frozen_string_literal: true

# db/migrate/20201122143454_rename_type_to_transaction_type_in_transactions.rb
class RenameTypeToTransactionTypeInTransactions < ActiveRecord::Migration[6.0]
  def up
    rename_column :transactions, :type, :transaction_type
  end

  def down
    rename_column :transactions, :transaction_type, :type
  end
end
