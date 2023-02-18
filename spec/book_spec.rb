require 'spec_imports'

describe Book do
  context '#Add  book' do
    # Arrange
    before :each do
      @book = Book.new 'Title', 'Author'
    end
    # Act

    # Assert
    it 'checks book title' do
      expect(@book.title).to eq 'Title'
    end

    it 'checks book author' do
      expect(@book.author).to eq 'Author'
    end

    it 'create Book object from parameters' do
      expect(@book).to be_an_instance_of Book
    end
  end

  context 'Add a rental' do
    it 'Add rental to rentals Array' do
      # Arrange
      @book = Book.new('Title', 'Author')
      @person = Student.new('DA-M2', 'Koami', parent_permission: true, id: 10)
      
      # Act
      @rental = Rental.new('2023/02/17', @book, @person)

      # Assert
      expect(@book.rentals.length).to eq 1
    end
  end

  context 'converting book to JSON' do
    it 'Check json string' do
      # Arrange
      @book = Book.new('Title', 'Author')

      # Act
      json_obj = @book.to_json.to_s

      # Assert
      expect(json_obj).to eq '{"json_class":"Book","title":"Title","author":"Author"}'
    end
  end

  context '>> Creating book object from JSON' do
    it '>> Check json string' do
      # Arrange
      @book = JSON.parse('{"json_class":"Book","title":"Title","author":"Author"}', create_additions: true)

      # Act

      # Assert
      expect(@book).to be_an_instance_of Book
    end
  end
end