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
  puts 'Press 5 to assign a doctor to a patient.'
  puts 'Press 6 to look up a doctor based on specialty'
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
  elsif user_input == 5
    assign_doctor
  elsif user_input == 6
    specialty_lookup
  elsif user_input == 9
    exit
  else
    main_menu
  end
end

def add_patient
  puts "Please enter the new patient name:"
  @pat_name = gets.chomp
  "\n\n"

  puts "Please enter the birthday of the new patient:"
  @pat_birth = gets.chomp
  "\n\n"

  puts "Please enter the id of the doctor you would like"
  Doctor.all
  @pat_doctor = gets.chomp.to_i

  current_patient = Patient.new({'name' => @pat_name, 'birthday' => @pat_birth, 'doctor' => @pat_doctor})

  current_patient.save

  puts "The new patient #{current_patient.name}, has been added to the system!"
  "\n\n"
  main_menu
end

def assign_doctor
  puts "Pick a patient to update their information:"
  Patient.all
  @pat_id = gets.chomp.to_i
  puts "Pick a doctor to assign to a patient:"
  Doctor.all
  @doc_id = gets.chomp.to_i
  Patient.pick(@doc_id, @pat_id)
  puts "Doctor set for patient!"
  main_menu
  end

def list_patient
  puts "Here's a list of all the patients:"
  Patient.all
    "\n\n"
  main_menu
end

def add_doctor
  puts "Please enter the name of the doctor:"
   doc_name = gets.chomp
  "\n\n"

  puts "Please enter the specialty of the doctor:"
   doc_spec = gets.chomp
  "\n\n"

  new_doctor = Doctor.new({'name' => doc_name, 'specialty' => doc_spec})
  new_doctor.save

  puts "Doctor #{doc_name} has been added to the system!"
  "\n\n"

  main_menu
end

def list_doctor
  puts "Here's a list of all the doctors:"
  Doctor.all
    "\n\n"
  main_menu
end

def specialty_lookup
  puts "here is a list of specialties to choose from: "
  Doctor.specialty
  puts "Please enter a specialty to see doctors available:"
  spec_choice = gets.chomp
  puts Doctor.list_specialty(spec_choice)

  main_menu


end


main_menu



