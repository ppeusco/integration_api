# frozen_string_literal: true

class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments, id: :string do |t|
      t.date :payment_date
      t.string :currency
      t.string :total_amount
      t.string :total_discounts
      t.string :total_with_discounts
      t.string :client_id

      t.timestamps
    end

    add_index :payments, :client_id
  end
end
