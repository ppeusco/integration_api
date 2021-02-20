# frozen_string_literal: true

# app/models/client.rb
class Client < ApplicationRecord
  # model association
  has_many :transactions, dependent: :destroy

  # validations
  validates_presence_of :email, :first_name, :last_name, :job, :country, :address, :zip_code, :phone
end
