require 'rspec'
require 'pg'
require 'doctor_list'
require 'patient_list'

DB = PG.connect({:dbname => 'office'})

# RSpec.configure do |config|
#   config.after(:each) do
#     DB.exec("DELETE FROM doctors *;")
#     DB.exec("DELETE FROM patients *;")
#   end
# end
