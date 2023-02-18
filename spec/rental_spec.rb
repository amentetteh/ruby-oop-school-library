
require_relative '../entities/book'
require_relative '../entities/student'
require_relative '../entities/rental'

describe Rental do
  describe '>> new Rental' do
    it '>> Create rental' do
      # Arrange
      @book = Book.new('Title', 'Author')
      @person = Student.new('GL-M2',26, 'Koami', parent_permission: true, id: 10)
      @rental = Rental.new('2023/02/17', @book, @person)

      # Act

      # Assert
      expect(@rental).to be_an_instance_of Rental
    end
  end

  context '>> convert Rental to JSON' do
    it '>> Check json string' do
      # Arrange
      @book = Book.new('Title', 'Author')
      @person = Student.new(10,'GL-M2',26, 'Koami', parent_permission: true)
      @rental = Rental.new('2023/02/17', @book, @person, 15)

      # Act
      json_obj = @rental.to_json.to_s
      # rubocop:disable Layout/LineLength
      json_str = '{"json_class":"Rental","date":"2023/02/17","book":{"json_class":"Book","title":"Title","author":"Author"},"person":{"json_class":"Student","id":10,"classroom":"GL-M2","age":26,"name":"Koami","parent_permission":{"parent_permission":true}},"id":15}'

      # Assert
      expect(json_obj).to eq json_str
    end
  end

  context '>> Create rental from JSON' do
    it '>> Check json string' do
      # Arrange
      @rental = JSON.parse(
        '{"json_class":"Rental","date":"2023/02/17","book":{"json_class":"Book","title":"Title","author":"Author"},"person":{"json_class":"Student","age":"26","classroom":"GL-M2","name":"Koami","parent_permission":true}}', create_additions: true
      )

      # Act

      # Assert
      expect(@rental).to be_an_instance_of Rental
    end
  end
end