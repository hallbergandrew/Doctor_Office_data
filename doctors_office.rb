require 'pg'
require './lib/doctor_list.rb'
require './lib/patient_list.rb'

DB = PG.connect({:dbname => 'office'})

def main_menu
  puts '*~The Database~*'
  "\n\n"
  puts 'Press 1 to add a patient.'
  puts 'Press 2 to see the patient list.'
  puts 'Press 3 to add a doctor.'
  puts 'Press 4 to see the doctor list.'
  puts 'Press 9 to exit.'

  user_input = gets.chomp.to_i
  if user_input == 1
    add_patient
  elsif user_input == 2
    list_patient
  elsif user_input == 3
    add_doctor
  elsif user_input == 4
    list_doctor
  elsif user_input == 9
    exit
  else
    main_menu
  end
end

def add_patient
  puts "Please enter the new patient name:"
  pat_name = gets.chomp
  "\n\n"

  puts "Please enter the birthday of the new patient:"
  pat_birth = gets.chomp
  "\n\n"

  DB.exec("INSERT INTO patients (name, birthday) VALUES ('#{pat_name}', '#{pat_birth}');")
  "\n\n"

  puts "The new patient #{pat_name}, has been added to the system!"
  "\n\n"
  main_menu
end

def list_patient
  puts "Here's a list of all the patients:"
  results = DB.exec("SELECT name FROM patients;")
  results.each do |result|
    puts result['name']
    "\n\n"
  end
  main_menu
end

def add_doctor
  puts "Please enter the name of the doctor:"
   doc_name = gets.chomp
  "\n\n"

  puts "Please enter the specialty of the doctor:"
   doc_spec = gets.chomp
  "\n\n"

  DB.exec("INSERT INTO doctors (name, specialty) VALUES ('#{doc_name}', '#{doc_spec}');")
  "\n\n"

  puts "Doctor #{doc_name} has been added to the system!"
  "\n\n"

  main_menu
end

def list_doctor
  puts "Here's a list of all the doctors:"
  results = DB.exec("SELECT name FROM doctors;")
  results.each do |result|
    puts result['name']
    "\n\n"
  end
  main_menu
end


main_menu



