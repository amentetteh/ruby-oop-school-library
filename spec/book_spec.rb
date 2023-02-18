require_relative '../entities/book'
require_relative '../entities/student'
require_relative '../entities/rental'
require 'json'

describe Book do
  before :each do
    @book = Book.new 'Rich Dad, Poor Dad', 'Robert Kiwozaki'
    puts @book.rentals
    puts 'Book1'
    @student = Student.new 11, 'Class 6', 17, 'Chloe', 'y'
    @date = '02/17/2023'
    puts 'Book2'
    puts @book.rentals
  end
  context "When testing the Book class" do 
    it "Given title and author a Book Object must be returned" do 
      expect(@book).to be_an_instance_of Book
    end  

    it "Rented Book should be added to book rental list" do
      @book.add_rental(@date, @student)
      puts @book.rentals
      expect(@book.rentals.length).to eql 2
    end

    it "Returns JSON after a book added" do
      expect(@book.to_json).to eql '{"json_class":"Book","title":"Rich Dad, Poor Dad","author":"Robert Kiwozaki"}'
    end 
  end  
end
