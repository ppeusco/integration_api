# frozen_string_literal: true

# Create the Payments table

class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments, id: :string do |table|
      table.date :payment_date
      table.string :currency
      table.string :total_amount
      table.string :total_discounts
      table.string :total_with_discounts
      table.string :client_id

      table.timestamps
    end

    add_index :payments, :client_id
  end
end
