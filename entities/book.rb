require_relative './rental'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    rental = Rental.new(date, self, person)
    @rentals.push(rental)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'title' => @title,
      'author' => @author
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['title'], object['author'])
  end
end
