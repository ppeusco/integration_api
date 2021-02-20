# frozen_string_literal: true

# db/migrate/20201026105503_add_type_to_transactions.rb
class AddTypeToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :type, :integer
  end
end
