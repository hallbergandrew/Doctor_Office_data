require 'rspec'
require 'pg'
require './lib/doctor_list.rb'
require './lib/patient_list.rb'

DB = PG.connect({:dbname => 'to_do_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM lists *;")
    DB.exec("DELETE FROM tasks *;")
  end
end
