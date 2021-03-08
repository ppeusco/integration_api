# frozen_string_literal: true

class ProcessRegistryJob < ApplicationJob
  queue_as :process_registry

  def perform(args = {})
    TransactionsManager::ProcessRegistryOrganizer.call!(registry: args[:registry])
  end
end
