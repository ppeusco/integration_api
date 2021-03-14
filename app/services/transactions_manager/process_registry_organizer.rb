# frozen_string_literal: true

module TransactionsManager
  # This class call a sequence of 3 interactors
  class ProcessRegistryOrganizer
    include Interactor::Organizer

    organize [
      FindOrCreateClient,
      CreatePayment,
      CreateTransactions
    ]
  end
end
