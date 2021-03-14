# frozen_string_literal: true

# This class has the responsibility of mapping a record in a hash.
class Registry < Stack
  def to_hash
    RegistryManager::HashCreator.call(registry: self)
  end
end
