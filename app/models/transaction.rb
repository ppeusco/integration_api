class Transaction < ApplicationRecord
  # model association
  belongs_to :client

  # validations
  validates_presence_of :amount, :client_id, :type  

  enum type: { aprobado: 1, rechazado: 2 }
end
