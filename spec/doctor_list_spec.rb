require 'spec_helper'

describe Doctor do
  it 'is initialized with a name' do
    doctor = Doctor.new({'name' =>'Doctor TicTac', 'specialty' => 'ENT'})
    doctor.should be_an_instance_of Doctor
  end

  it 'tells you its name' do
    doctor = Doctor.new({'name' => 'Doctor Address'})
    doctor.name.should eq 'Doctor Address'
  end

  it 'lets you save doctors to the database' do
    doctor = Doctor.new({'name' => 'Emily Zhang', 'specialty' => 'ENT'})
    doctor.save
    Doctor.all.should eq [doctor]
  end

  it 'is the same doctor if it has the same name' do
    doctor1 = Doctor.new({'name' => 'Emily Zhang', 'specialty' => 'ENT'})
    doctor2 = Doctor.new({'name' => 'Emily Zhang', 'specialty' => 'ENT'})
    doctor1.should eq doctor2
  end

  it 'lists all the doctors of a certain specialty' do
    doctor1 = Doctor.new({'name' => 'Emily Zhang', 'specialty' => 'ENT'})
    doctor2 = Doctor.new({'name' => 'Andrew', 'specialty' => 'ENT'})
    Doctor.list_specialty('ENT')
    doctor1.should be_an_instance_of Doctor
  end
end

