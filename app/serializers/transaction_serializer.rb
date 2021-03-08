class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :amount, :transaction_type, :client_id
end
