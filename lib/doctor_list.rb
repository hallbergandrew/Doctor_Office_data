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

  def self.list_specialty(specialty)
    @specialty = specialty
    specialties = DB.exec ("SELECT name FROM doctors WHERE specialty = '#{@specialty}';")
    special =[]
    # specialties = specialties.first
    # binding.pry
    specialties.each do |specialty|
        special << specialty['name']
    end
    puts "The special doctors for #{@specialty} are: "
    puts special
  end
  def self.specialty
    results = DB.exec("SELECT specialty FROM doctors;")
    results.each do |result|
      puts "Specialty: " + result['specialty']
    end
  end

end

