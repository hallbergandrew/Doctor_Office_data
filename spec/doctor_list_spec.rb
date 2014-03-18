require './spec/spec_helper'

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM doctors *;")
  end

describe Doctor do
  it 'is initialized with a name' do
    doctor = Doctor.new({:name =>'Doctor TicTac', :specialty => 'ENT'})
    doctor.should be_an_instance_of Doctor
  end

  it 'tells you its name' do
    doctor = Doctor.new({:name => 'Doctor Address'})
    doctor.name.should eq 'Doctor Address'
  end
end
