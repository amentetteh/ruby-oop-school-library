class Rental
  attr_accessor :id, :date, :book, :person

  def initialize(date, book, person, id = Random.rand(1..1000))
    @date = date
    @book = book
    @person = person
    @id = id
    book.rentals << self
    person.rentals << self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'date' => @date,
      'book' => @book,
      'person' => @person,
      'id' => @id
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['date'], object['book'], object['person'], object['id'])
  end
end
