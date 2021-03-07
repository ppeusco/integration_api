# frozen_string_literal: true

module TransactionsManager
  class ProcessRegistryOrganizer
    include Interactor::Organizer

    organize [
      FindOrCreateClient,
      CreatePayment,
      CreateTransactions
    ]
  end
end
