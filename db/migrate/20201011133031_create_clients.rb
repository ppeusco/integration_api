# frozen_string_literal: true

# db/migrate/20201011133031_create_clients.rb
class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients, id: :string do |table|
      table.string :email
      table.string :first_name
      table.string :last_name
      table.string :job
      table.string :country
      table.string :address
      table.string :zip_code
      table.string :phone

      table.timestamps
    end
  end
end
