# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_08_140856) do

  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'clients', id: :string, force: :cascade do |t|
    t.string 'email'
    t.string 'first_name'
    t.string 'last_name'
    t.string 'job'
    t.string 'country'
    t.string 'address'
    t.string 'zip_code'
    t.string 'phone'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'payments', id: :string, force: :cascade do |t|
    t.date 'payment_date'
    t.string 'currency'
    t.string 'total_amount'
    t.string 'total_discounts'
    t.string 'total_with_discounts'
    t.string 'client_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['client_id'], name: 'index_payments_on_client_id'
  end

  create_table 'transactions', id: :string, force: :cascade do |t|
    t.string 'amount'
    t.string 'client_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'transaction_type'
    t.string 'payment_id'
    t.index ['client_id'], name: 'index_transactions_on_client_id'
  end

end
