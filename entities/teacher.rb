require_relative './person'

class Teacher < Person
  attr_accessor :specialization, :id

  def initialize(specialization, age, name = 'Unknown', parent_permission = 'y', id = Random.rand(1..1000))
    super(age, name, parent_permission, id)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_json(*args)
    { 
      JSON.create_id => self.class.name,
      'id' => @id,
      'specialization' => @specialization,
      'age' => @age,
      'name' => @name,
      'parent_permission' => @parent_permission
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['specialization'], object['age'], object['name'], object['parent_permission'],object['id'])
  end
end