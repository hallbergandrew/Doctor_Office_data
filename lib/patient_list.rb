require 'pg'
require 'pry'

class Patient
  attr_reader(:name, :birthday, :doctor)

  DB = PG.connect({:dbname => 'office'})

  def initialize(attributes)
    @name = attributes['name']
    @birthday = attributes['birthday']
    @doctor = attributes['doctor']
  end

  def self.all
    results = DB.exec("SELECT * FROM patients;")
    patients = []
    results.each do |result|
      puts "id: " + result['id'] + "  name: " +result['name']
      patients << Patient.new(result)
    end
    patients
  end

  def save
    DB.exec("INSERT INTO patients (name, birthday, doctor) VALUES ('#{@name}', '#{@birthday}', '#{@doctor}');")
  end

  def ==(another_patient)
    self.name == another_patient.name
  end

  def self.pick(doctor_id, patient_id)
    @doctor_id = doctor_id
    @patient_id = patient_id

    DB.exec("UPDATE patients SET doctor = '#{@doctor_id}' WHERE id = '#{@patient_id}';")



  end


end
