# frozen_string_literal: true

# app/models/transaction.rb
class Transaction < ApplicationRecord
  # model association
  belongs_to :client
  belongs_to :payment
  # validations
  validates_presence_of :amount, :client_id, :transaction_type, :payment_id

  enum transaction_type: { aprobado: 1, rechazado: 2 }
end
