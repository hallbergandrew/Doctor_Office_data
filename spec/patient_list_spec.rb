require './spec/spec_helper'

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM patients *;")
  end

describe Patient do
  it 'is initialized with a name, birthday, and doctor' do
    patient = Patient.new({:name =>'Andrew Bird', :birthday => '09/04/1978', :doctor => 'Doctor White'})
    patient.should be_an_instance_of Patient
  end

  it 'tells you the name of the patient' do
    patient = Patient.new({:name => 'Britney Spears'})
    patient.name.should eq 'Britney Spears'
  end
end
