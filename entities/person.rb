require_relative '../nameable'
require_relative '../decorators/capitalize_decorator'
require_relative '../decorators/trimmer_decorator'
require_relative './rental'

class Person < Nameable
  # attr_reader :id
  attr_accessor :id, :name, :age, :rentals

  def initialize(id, age, name = 'Unknown', parent_permission = 'y')
    super()
    @id = id || Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals.push(rental)
    rental.person = self
  end
end
