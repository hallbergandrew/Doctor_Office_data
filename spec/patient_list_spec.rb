require 'spec_helper'

describe Patient do
  it 'is initialized with a name, birthday, and doctor' do
    patient = Patient.new({'name' =>'Andrew Bird', 'birthday' => '2011-11-14', 'doctor' => 9})
    patient.should be_an_instance_of Patient
  end

  it 'tells you the name of the patient' do
    patient = Patient.new({'name' => 'Britney Spears'})
    patient.name.should eq 'Britney Spears'
  end

  it 'lets you save patients to the database' do
    patient = Patient.new({'name' => 'Seth Green', 'birthday' => '2011-11-14','doctor' => 8})
    patient.save
    Patient.all.should eq [patient]
  end
end
