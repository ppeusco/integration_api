# frozen_string_literal: true

# Create the Clients table
class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients, id: :string do |table|
      t.string :email
      t.string :first_name
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
