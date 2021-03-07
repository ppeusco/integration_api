# frozen_string_literal: true

class Payment < ApplicationRecord
  # model association
  belongs_to :client

  # scopes
  scope :received, -> { where('payment_date <= ?', Time.zone.today) }
  scope :pending, ->  { where('payment_date > ?', Time.zone.today) }
  scope :in_ars, -> { where(currency: '000') }
  scope :in_usd, -> { where(currency: '001') }

  # validations
  validates_presence_of :payment_date, :currency, :total_amount, :total_discounts, :total_with_discounts, :client_id
end
