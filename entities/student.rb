require_relative './person'

class Student < Person
  attr_reader :classroom
  attr_accessor :id
 
  def initialize(classroom, age, name = 'unknown', parent_permission = true, id = Random.rand(1..1000))
    super(age, name, parent_permission, id)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'classroom' => @classroom,
      'age' => @age,
      'name' => @name,
      'parent_permission' => @parent_permission
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['classroom'], object['age'], object['name'], object['parent_permission'], object['id'])
  end
end