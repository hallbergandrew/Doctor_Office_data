class Patient
  attr_reader(:name, :birthday, :doctor)

  def initialize(attributes)
    @name = attributes[:name]
    @birthday = attributes[:birthday]
    @doctor = attributes[:doctor]
  end
end
