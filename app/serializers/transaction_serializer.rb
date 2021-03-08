class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :amount, :transaction_type, :payment_id, :client_id
end
