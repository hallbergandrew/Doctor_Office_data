require 'pg'
require 'pry'

class Doctor
  attr_reader :name, :specialty

  DB = PG.connect({:dbname => 'office'})

  def initialize(attributes)
    @name = attributes['name']
    @specialty = attributes['specialty']
  end

  def self.all
    results = DB.exec("SELECT * FROM doctors;")
    doctors =[]
    results.each do |result|
      puts "id: " + result['id'] + "  name: " +result['name']
      doctors << Doctor.new(result)
    end
    doctors
  end

  def save
    DB.exec("INSERT INTO doctors (name, specialty) VALUES ('#{@name}', '#{@specialty}');")
  end

  def ==(another_doctor)
    self.name == another_doctor.name
  end

end

