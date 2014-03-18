class Doctor
  attr_reader(:name, :specialty)

  def initialize(attributes)
    @name = attributes[:name]
    @specialty = attributes[:specialty]
  end

end
