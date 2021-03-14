# frozen_string_literal: true

# Serialize objects from the Client model.
class ClientSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :job, :country, :address, :zip_code,
             :phone
end
