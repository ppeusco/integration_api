class Client < ApplicationRecord
  # validations
  validates_presence_of :email, :first_name, :last_name, :job, :country, :address, :zip_code, :phone  
end
