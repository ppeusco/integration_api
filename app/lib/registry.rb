class Registry < Stack
  def to_hash
    RegistryManager::HashCreator.call(registry: self)
  end
end
