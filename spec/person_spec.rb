require_relative '../entities/book'
require_relative '../entities/teacher'
require_relative '../entities/rental'
require 'json'

describe Person do
  before :each do
    @person = Person.new 3444, 12, 'Gerson', 'y'
    @teacher = Teacher.new 344_555, 'Biology', 'ODONKOR', 'y'
    @book = Book.new 'Rich Dad, Poor Dad', 'Robert Kiwozaki'
    @rental = Rental.new '02/07/2023', @book, @teacher
  end
  context 'When testing the Book class' do
    it 'Given id, age, name  and permission a Person Object must be returned' do
      expect(@person).to be_an_instance_of Person
    end

    # it 'Should return true or false wether the person has more than 18 or not' do
    #   expect(@person.of_age?).to eql false
    # end

    it 'Should return true if the person can use the service' do
      expect(@person.can_use_services?).to eql 'y'
    end

    it 'Rented Book should be added to book rental list' do
      @person.add_rental(@rental)
      puts @book.rentals
      expect(@book.rentals.length).to eql 1
    end
  end
end
