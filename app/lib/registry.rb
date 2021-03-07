# frozen_string_literal: true

class Registry < Stack
  def to_hash
    RegistryManager::HashCreator.call(registry: self)
  end
end
