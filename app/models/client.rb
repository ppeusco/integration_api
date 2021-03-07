# frozen_string_literal: true

class Client < ApplicationRecord
  # model association
  has_many :transactions, dependent: :destroy
  has_many :payments, dependent: :destroy
  has_many :payments_in_usd, -> { in_usd }, class_name: 'Payment'
  has_many :payments_in_ars, -> { in_ars }, class_name: 'Payment'
  has_many :pending_payments, -> { pending }, class_name: 'Payment'
  has_many :received_payments, -> { received }, class_name: 'Payment'

  # validations
  validates_presence_of :email, :first_name, :last_name, :job, :country, :address, :zip_code, :phone
end
